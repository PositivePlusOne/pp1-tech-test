import 'package:flutter/material.dart';
import '../utilities/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

Widget getTabBar(int selectedTab, Function(int) setActiveTab) {
  return Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25))),
    margin: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: selectedTab == 0 ? appGreen : Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, top: 10, bottom: 10),
                  child: Text(
                    "Popular",
                    style: GoogleFonts.albertSans(
                        textStyle: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w800)),
                  ),
                  // color: appGreen,
                )
              ],
            ),
            onTap: () => setActiveTab(0)),
        const Spacer(),
        InkWell(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: selectedTab == 1 ? appGreen : Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, top: 10, bottom: 10),
                  child: Text(
                    "Clips",
                    style: GoogleFonts.albertSans(
                        textStyle: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w800)),
                  ),
                )
              ],
            ),
            onTap: () => setActiveTab(1)),
        const Spacer(),
        InkWell(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: selectedTab == 2 ? appGreen : Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, top: 10, bottom: 10),
                  child: Text(
                    "Following",
                    style: GoogleFonts.albertSans(
                        textStyle: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w800)),
                  ),
                )
              ],
            ),
            onTap: () => setActiveTab(2)),
      ],
    ),
  );
}
