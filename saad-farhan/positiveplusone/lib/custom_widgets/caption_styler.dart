import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:positiveplusone/utilities/app_color.dart';

Widget buildStyledText(String text) {
  List<TextSpan> children = [];

  void addTextSpan(String text, TextStyle style) {
    children.add(TextSpan(text: text, style: style));
  }

  // Regular expression to match both <link> and @ mentions
  final RegExp regex = RegExp(r'<link>(.*?)<\/link>|@(\w+)|(\S+)');

  for (Match match in regex.allMatches(text)) {
    if (match.group(1) != null) {
      // Handle <link> segments
      addTextSpan(
          match.group(1)!,
          GoogleFonts.albertSans(
              textStyle: TextStyle(
            decoration: TextDecoration.underline,
            color: captionLink,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          )));
    } else if (match.group(2) != null) {
      // Handle @ mentions
      addTextSpan(
          "@${match.group(2)!}",
          GoogleFonts.albertSans(
              textStyle: TextStyle(
            color: captionMention,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          )));
    } else if (match.group(3) != null) {
      // Handle other words

      addTextSpan(
        match.group(3)!,
        GoogleFonts.albertSans(
            textStyle: TextStyle(
          color: captionGray,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        )),
      );
    }
    addTextSpan(' ', TextStyle(fontSize: 16, fontWeight: FontWeight.normal));
  }

  return RichText(
    text: TextSpan(
      children: children,
    ),
  );
}
