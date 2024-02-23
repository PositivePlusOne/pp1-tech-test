import 'package:flutter/material.dart';

Widget getBottomNavItem(IconData icon, String text,
    {Color? color, bool isActive = false, bool isBadge = false}) {
  return Container(
      margin: const EdgeInsets.all(8),
      decoration: isActive
          ? const BoxDecoration(color: Colors.white, shape: BoxShape.circle)
          : const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isBadge
              ? Badge(
                  backgroundColor: Colors.black,
                  smallSize: 10,
                  child: Icon(icon,
                      color: !isActive
                          ? const Color.fromRGBO(107, 107, 103, 1)
                          : const Color.fromRGBO(142, 58, 226, 1)),
                )
              : Icon(icon,
                  color: !isActive
                      ? const Color.fromRGBO(107, 107, 103, 1)
                      : const Color.fromRGBO(142, 58, 226, 1)),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ));
}

Widget getBottomNavAddItem() {
  return Container(
      margin: const EdgeInsets.all(8),
      decoration:
          const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      child: const Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle_outline, color: Colors.white),
            ],
          )));
}
