import 'package:flutter/material.dart';
import 'package:positiveplus/ui/views/navbar/navbar_view.dart';
import 'package:positiveplus/ui/widgets/custom_appbar_widget.dart';
import 'package:positiveplus/ui/widgets/custom_drawer_widget.dart';
import 'package:positiveplus/ui/widgets/post_widget.dart';
import 'package:positiveplus/ui/widgets/shader_mask_list_widget.dart';
import 'package:positiveplus/ui/widgets/slider_container.dart';
import 'package:stacked/stacked.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);

  final controller = PageController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: CustomAppBar(size: size, scaffoldKey: scaffoldKey),
        ),
        drawer: CustomDrawer(size: size),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Container(
                color: const Color(0xFFf6f6ec),
                height: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.3,
                      child: PageView(
                        controller: controller,
                        children: [
                          SliderContainer(
                            size: size,
                          ),
                          SliderContainer(
                            size: size,
                            color: const Color(0xFF4ABDFF),
                          ),
                          SliderContainer(
                            size: size,
                            color: const Color(0xFFD3F556),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.017,
                    ),
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: ScrollingDotsEffect(
                        activeDotColor: const Color(0xffECACD0),
                        dotColor: const Color(0xFFD2D2D2),
                        dotHeight: size.height * 0.007,
                        dotWidth: size.height * 0.007,
                        activeDotScale: size.height * 0.002,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    CustomTabBar(size: size, viewModel: viewModel,),
                  ],
                ),
              ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.size,
    required this.viewModel,
  });

  final Size size;
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: size.height * 0.52,
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.06,
                          vertical: size.height * 0.01),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(size.height * 0.08),
                        ),
                        child: TabBar(
                          // splashFactory: NoSplash.splashFactory,
                          overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.transparent),
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: Colors.transparent,
                          labelStyle: const TextStyle(
                              color: Color(0xff4A4A47),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'AlbertSans'),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                size.height * 0.08), // Creates border
                            color: const Color(0xff29E774),
                          ),
                          tabs: [
                            Padding(
                              padding: EdgeInsets.all(size.height * 0.005),
                              child: const Center(
                                child: Text("Popular"),
                                // child: Text(viewModel
                                //     .posts.first.title!),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(size.height * 0.005),
                              child: const Center(
                                child: Text("Clips"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(size.height * 0.005),
                              child: const Center(
                                child: Text("Followings"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        PostList(
                          size: size,
                          viewModel: viewModel,
                          imageUrl: "image",
                        ),
                        PostList(
                          size: size,
                          viewModel: viewModel,
                          imageUrl: "",
                        ),
                        PostList(
                          size: size,
                          viewModel: viewModel,
                          imageUrl: "image",
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: NavbarView(),
            ),
          ),
        ],
      ),
    );
  }
}

class PostList extends StatelessWidget {
  const PostList({
    super.key,
    required this.size,
    required this.viewModel,
    this.imageUrl = "",
  });

  final Size size;
  final HomeViewModel viewModel;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ShaderMaskList(
      size: size,
      list: ListView.builder(
        itemCount: viewModel.posts.length,
        itemBuilder: (context, index) {
          return Post(
            onShareTap: () {
              viewModel.showBottomSheet(title: "Share Feature Coming Soon");
            },
            onClick: () {
              viewModel.showDialog(title: "Feature Coming Soon!");
            },
            likes: viewModel.likes,
            likeIcon: GestureDetector(
              onTap: () {
                viewModel.likePost(isLike: !viewModel.isLiked);
              },
              child: Icon(viewModel.icon, color: viewModel.color),
            ),
            onTap: (tag) {
              viewModel.showDialog(title: tag);
            },
            dropDown: DropdownButton(
              underline: const SizedBox(),
              icon: const Icon(Icons.more_horiz),
              items: viewModel.items.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? value) {},
            ),
            size: size,
            postImageUrl: imageUrl.isNotEmpty
                ? viewModel.posts[index].featuredImage!
                : "",
            tags: viewModel.tags,
            userName: "@${viewModel.posts[index].title!}",
            description: viewModel.posts[index].body!,
            time:
                viewModel.convertDateIntoAgo(viewModel.posts[index].createdOn!),
          );
        },
      ),
    );
  }
}
