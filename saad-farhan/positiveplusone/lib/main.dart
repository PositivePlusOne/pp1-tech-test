import 'package:flutter/material.dart';
import 'package:positiveplusone/custom_widgets/app_bar.dart';
import 'package:positiveplusone/custom_widgets/post_card.dart';
import 'package:positiveplusone/custom_widgets/recommended_section.dart';
import 'package:positiveplusone/custom_widgets/tab_bar.dart';
import 'package:positiveplusone/models/post_model.dart';
import 'package:positiveplusone/services/api_service.dart';
import 'package:positiveplusone/utilities/helper_functions.dart';
import "custom_widgets/bottom_bar.dart";
import "utilities/app_color.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Positive+1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // API Network var
  final ApiService _apiService = ApiService();
  ScrollController? _scrollController;

  // Variable to keep track of current dot indicator
  int _currentPos = 0;

  // Variable to set the appbar color based on scroll
  Color appBarColor = appPink;

  // Variable to control the visibility of reommended section
  bool recommendedSectionVisibility = true;

  // Helper Variables to get posts
  final int pageSize = 10;
  bool _isLoading = false;
  int totalCount = 0;
  int _selectedTab = 0;
  int _selectedBottomTab = 0;

  List<Post> postData = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    _fetchData();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      if (_scrollController!.offset > 10) {
        appBarColor = appBarGray;
        recommendedSectionVisibility = false;
      } else {
        appBarColor = appPink;
        recommendedSectionVisibility = true;
      }
    });
    if (_scrollController!.position.pixels ==
            _scrollController!.position.maxScrollExtent &&
        postData.length < totalCount) {
      // Fetch more data when the end of the list is reached
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    if (_isLoading) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    try {
      final response =
          await _apiService.fetchData("/posts/${postData.length}/10");
      if (response.statusCode == 200) {
        final List<dynamic> postsJson = response.data["posts"] as List<dynamic>;
        totalCount = response.data["count"];
        setState(() {
          postData.addAll(
              postsJson.map((postJson) => Post.fromJson(postJson)).toList());
        });
      }
    } catch (error) {
      // Handle errors
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarGray,
      appBar: getAppBar(appBarColor),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                getRecommendedSection(recommendedSectionVisibility, _currentPos,
                    (position) {
                  setState(() {
                    _currentPos = position;
                  });
                }),
                getTabBar(_selectedTab, (p0) {
                  setState(() {
                    _selectedTab = p0;
                  });
                }),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    physics: const ScrollPhysics(),
                    itemCount: postData.length,
                    
                    itemBuilder: (context, index) {
                      if (postData.isEmpty) {
                        return Container();
                      } else {
                        final post = postData[index];
                        return getPostCard(
                          userImage: post.userImage,
                          userName: post.userName,
                          time: formatDuration(post.createdAd),
                          caption: post.caption,
                          tags: post.tags
                              .map((tag) => '#${tag.content}')
                              .join(' '),
                          likeCount: post.likes.length.toString(),
                          commentCount: post.comments.length.toString(),
                          postUrl: post.imageUri,
                        );
                      }
                    },
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 65)),
                _isLoading
                    ? Center(
                        child: CircularProgressIndicator(color: appPink),
                      )
                    : Container()
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: NavigationBar(
                    elevation: 0,
                    backgroundColor: appWhiteWithOpacity,
                    destinations: <Widget>[
                      InkWell(
                        child: getBottomNavItem(Icons.home, "Hub",
                            color: Colors.white,
                            isActive: _selectedBottomTab == 0),
                        onTap: () => setState(() {
                          _selectedBottomTab = 0;
                        }),
                      ),
                      InkWell(
                        child: getBottomNavItem(Icons.search, "Search",
                            isActive: _selectedBottomTab == 1),
                        onTap: () => setState(() {
                          _selectedBottomTab = 1;
                        }),
                      ),
                      getBottomNavAddItem(),
                      InkWell(
                        child: getBottomNavItem(Icons.chat, "Chat",
                            color: Colors.white,
                            isBadge: true,
                            isActive: _selectedBottomTab == 2),
                        onTap: () => setState(() {
                          _selectedBottomTab = 2;
                        }),
                      ),
                      InkWell(
                        child: getBottomNavItem(Icons.book_outlined, "Guidance",
                            color: Colors.white,
                            isActive: _selectedBottomTab == 3),
                        onTap: () => setState(() {
                          _selectedBottomTab = 3;
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
