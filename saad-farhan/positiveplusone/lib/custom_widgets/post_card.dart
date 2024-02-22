import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:positiveplusone/custom_widgets/caption_styler.dart';

Widget getPostCard(
    {required String userImage,
    required String userName,
    required String time,
    String? postUrl,
    required String caption,
    required String tags,
    required String likeCount,
    required String commentCount}) {
  return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
    Container(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
          const SizedBox(width: 10.0), // Add spacer widget with desired width
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("@$userName",
                  style: GoogleFonts.albertSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18))),
              Text(time,
                  style: GoogleFonts.albertSans(
                    textStyle: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.w400),
                  )),
            ],
          ),
          const Spacer(),
          const Column(
            children: [Icon(Icons.more_horiz)],
          )
        ],
      ),
    ),
    postUrl != null
        ? Container(
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            height: 361,
            width: 380,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(fit: BoxFit.cover, postUrl),
            ))
        : Container(),
    Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 12),
        child: Row(
          children: [
            Expanded(
              child: 
              buildStyledText(caption)
            )
          ],
        )),
    const SizedBox(
      height: 10,
    ),
    Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: [
            Expanded(
              child: Text(
                tags,
                style: GoogleFonts.albertSans(
                    textStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        )),
    const SizedBox(
      height: 10,
    ),
    Container(
      padding: const EdgeInsets.only(bottom: 20),
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Row(children: [
        const Column(
          children: [Icon(Icons.favorite_border)],
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          children: [
            Text(
              likeCount,
              style: GoogleFonts.albertSans(
                  textStyle: const TextStyle(fontWeight: FontWeight.w600)),
            )
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        const Column(
          children: [Icon(Icons.comment_outlined)],
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          children: [
            Text(
              commentCount,
              style: GoogleFonts.albertSans(
                  textStyle: const TextStyle(fontWeight: FontWeight.w600)),
            )
          ],
        ),
        const Spacer(),
        const Column(
          children: [Icon(Icons.send_outlined)],
        ),
      ]),
    ),
    Container(
      height: 3,
      color: Colors.white,
    )
  ]);
}
