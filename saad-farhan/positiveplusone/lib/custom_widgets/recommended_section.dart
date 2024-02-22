import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import "../utilities/app_color.dart";
import 'package:google_fonts/google_fonts.dart';

Widget getRecommendedSection(bool recommendedSectionVisibility, int currentPos,
    Function(int) onTapClose) {
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 300),
    child: !recommendedSectionVisibility
        ? Container()
        : Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 25, bottom: 11),
                color: appPink,
                child: Row(
                  children: [
                    Text("Recommended",
                        style: GoogleFonts.albertSans(
                          textStyle: TextStyle(
                              fontSize: 16,
                              color: appGrayWithFourOpacity,
                              fontWeight: FontWeight.w400),
                        )),
                    const Spacer(),
                    Icon(
                      Icons.close_outlined,
                      color: appGrayWithFourOpacity,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: appPink,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    )),
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
                // color: appPink,
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: const LimitedBox(
                            child: Text(
                          "U=U equals you and me ;)",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w400),
                        ))),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg"),
                        ),
                        const SizedBox(
                            width:
                                10.0), // Add spacer widget with desired width
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "@PositiveAndLoud",
                              style: GoogleFonts.albertSans(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18)),
                            ),
                            Text("10 minutes ago",
                                style: GoogleFonts.albertSans(
                                  textStyle: const TextStyle(
                                    fontSize: 10,
                                  ),
                                )),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: Center(
                    child: DotsIndicator(
                  dotsCount: 3,
                  position: currentPos,
                  onTap: (position) {
                    onTapClose(position);
                  },
                  decorator: DotsDecorator(
                    size: const Size(5, 5),
                    activeSize: const Size(10, 10),
                    color: appBlackWithOpacity, // Inactive color
                    activeColor: appPink,
                  ),
                )),
              ),
            ],
          ),
  );
}
