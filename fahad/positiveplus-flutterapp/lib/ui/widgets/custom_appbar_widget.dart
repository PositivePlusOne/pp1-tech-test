import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.size,
    required this.scaffoldKey,
  });

  final Size size;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffECACD0),
      width: double.infinity,
      height: size.height * 0.08,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.height * 0.006,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/svg/positive.svg',
              height: size.height * 0.025,
            ),
            const Spacer(),
            Badge(
              backgroundColor: Colors.black,
              smallSize: size.height * 0.015,
              child: GestureDetector(
                onTap: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                child: Container(
                  height: size.height * 0.045,
                  width: size.width * 0.095,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svg/bell.svg',
                      height: size.height * 0.022,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.025,
            ),
            GestureDetector(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: Container(
                height: size.height * 0.045,
                width: size.width * 0.095,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svg/person.svg',
                    height: size.height * 0.022,
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
