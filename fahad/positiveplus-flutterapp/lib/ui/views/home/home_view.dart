import 'package:flutter/material.dart';
import 'package:positiveplus/ui/views/navbar/navbar_view.dart';
import 'package:positiveplus/ui/widgets/post_widget.dart';
import 'package:positiveplus/ui/widgets/shader_mask_list_widget.dart';
import 'package:positiveplus/ui/widgets/slider_container.dart';
import 'package:stacked/stacked.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);

  final controller = PageController();

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Container(
                color: const Color(0xFFf6f6ec),
                height: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.36,
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
                    Flexible(
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
                                          borderRadius: BorderRadius.circular(
                                              size.height * 0.08),
                                        ),
                                        child: TabBar(
                                          // splashFactory: NoSplash.splashFactory,
                                          overlayColor:
                                              MaterialStateProperty.resolveWith(
                                                  (states) =>
                                                      Colors.transparent),
                                          indicatorSize:
                                              TabBarIndicatorSize.tab,
                                          dividerColor: Colors.transparent,
                                          labelStyle: const TextStyle(
                                              color: Color(0xff4A4A47),
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'AlbertSans'),
                                          indicator: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                size.height *
                                                    0.08), // Creates border
                                            color: const Color(0xff29E774),
                                          ),
                                          tabs: [
                                            Padding(
                                              padding: EdgeInsets.all(
                                                  size.height * 0.005),
                                              child: const Center(
                                                child: Text("Popular"),
                                                // child: Text(viewModel
                                                //     .posts.first.title!),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(
                                                  size.height * 0.005),
                                              child: const Center(
                                                child: Text("Clips"),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(
                                                  size.height * 0.005),
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
                                        ShaderMaskList(
                                          size: size,
                                          list: ListView.builder(
                                            itemCount: viewModel.posts.length,
                                            itemBuilder: (context, index) {
                                              return Post(
                                                size: size,
                                                postImageUrl: viewModel
                                                    .posts[index]
                                                    .featuredImage!,
                                                tags: viewModel.tags,
                                                userName:
                                                    "@${viewModel.posts[index].title!}",
                                                description: viewModel
                                                    .posts[index].body!,
                                                time: viewModel
                                                    .convertDateIntoAgo(
                                                        viewModel.posts[index]
                                                            .createdOn!),
                                              );
                                            },
                                          ),
                                        ),
                                        ShaderMaskList(
                                          size: size,
                                          list: ListView.builder(
                                            itemCount: viewModel.posts.length,
                                            itemBuilder: (context, index) {
                                              return Post(
                                                  size: size,
                                                  tags: viewModel.tags,
                                                  userName: "@${viewModel.posts[index].title!}",
                                                  description: viewModel
                                                      .posts[index].body!,
                                                  time: viewModel
                                                      .convertDateIntoAgo(
                                                          viewModel.posts[index]
                                                              .createdOn!));
                                            },
                                          ),
                                        ),
                                        ShaderMaskList(
                                          size: size,
                                          list: ListView.builder(
                                            itemCount: 10,
                                            itemBuilder: (context, index) {
                                              return Post(
                                                size: size,
                                                postImageUrl: viewModel
                                                    .posts[index]
                                                    .featuredImage!,
                                                tags: viewModel.tags,
                                                userName: "@${viewModel.posts[index].title!}",
                                                description: viewModel
                                                    .posts[index].body!,
                                                time: viewModel
                                                    .convertDateIntoAgo(
                                                        viewModel.posts[index]
                                                            .createdOn!),
                                              );
                                            },
                                          ),
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
                    ),
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
