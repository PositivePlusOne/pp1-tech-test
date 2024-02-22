import 'package:flutter/material.dart';
import '../utilities/app_color.dart';

PreferredSizeWidget getAppBar(Color appBarColor) {
  return AppBar(
    title: Image.asset(
      'assets/logo.png',
      fit: BoxFit.cover,
    ),
    actions: [
      Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: appBarIconBorderGray, width: 1.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.notifications_outlined),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Badge(
              smallSize: 12,
              backgroundColor: Colors.black,
              child: Container(), // Empty container as the badge content
            ),
          ),
        ],
      ),
      const SizedBox(
        width: 5,
      ),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: appBarIconBorderGray, width: 2.0),
        ),
        child: const Padding(
            padding: EdgeInsets.all(8), child: Icon(Icons.person_outline)),
      )
    ],
    backgroundColor: appBarColor,
  );
}
