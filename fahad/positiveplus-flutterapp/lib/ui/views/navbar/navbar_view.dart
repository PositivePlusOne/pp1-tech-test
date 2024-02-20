import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'navbar_viewmodel.dart';

class NavbarView extends StackedView<NavbarViewModel> {
  const NavbarView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NavbarViewModel viewModel,
    Widget? child,
  ) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.13,
      child: FloatingNavbar(
        fontSize: 10,
        backgroundColor: const Color(0xffF6F6EC),
        selectedItemColor: const Color(0xff8E3AE2),
        unselectedItemColor: const Color(0xff6B6B67),
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        borderRadius: 100,
        itemBorderRadius: 25,
        onTap: (int val) => {
          viewModel.changeIndex(val),
        },
        currentIndex: viewModel.index,
        items: [
          FloatingNavbarItem(
            customWidget: SvgPicture.asset(
              'assets/svg/hub.svg',
              height: 20,
            ),
            title: 'Hub',
          ),
          FloatingNavbarItem(
              customWidget: SvgPicture.asset(
                'assets/svg/search.svg',
                height: 20,
              ),
              title: 'Search'),
          FloatingNavbarItem(
            customWidget: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Icon(
                  Icons.add_circle_outline,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
          FloatingNavbarItem(
              customWidget: Badge(
                backgroundColor: Colors.black,
                smallSize: 8,
                child: SvgPicture.asset(
                  'assets/svg/chat.svg',
                  height: 20,
                ),
              ),
              title: 'Chat'),
          FloatingNavbarItem(
              customWidget: SvgPicture.asset(
                'assets/svg/guide.svg',
                height: 20,
              ),
              title: 'Guidance'),
        ],
      ),
    );

    // return Scaffold(
    //   backgroundColor: Colors.lightBlue,
    //   body: Container(
    //     width: double.infinity,
    //     height: 100,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(50),
    //       color: const Color(0xffF6F6EC),
    //     ),
    //     child: Row(
    //       children: [
    //         Column(
    //           children: [Text("Hub")],
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  @override
  NavbarViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      NavbarViewModel();
}
