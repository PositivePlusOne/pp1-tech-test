import 'package:flutter/material.dart';
import '../utilities/app_color.dart';

PreferredSizeWidget getAppBar(Color appBarColor) {
  return AppBar(
    title: Image.asset(
      'assets/logo.png',
      fit: BoxFit.cover,
    ),
    actions: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: appBarIconBorderGray, width: 1.0),
        ),
        child: const Padding(
            padding: EdgeInsets.all(8),
            child: Badge(
              smallSize: 10,
              backgroundColor: Colors.black,
              child: Icon(Icons.notifications_outlined),
            )),
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
