import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_tags/simple_tags.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
    required this.size,
    this.userName = "@PositiveAndLoud",
    this.userImage =
        "https://img.freepik.com/free-photo/portrait-man-laughing_23-2148859448.jpg?size=338&ext=jpg&ga=GA1.1.87170709.1707955200&semt=ais",
    this.time = "12 Minutes Ago",
    this.postImageUrl = "",
    this.description = "",
    this.likes = 42,
    this.comments = 42,
    required this.tags,
    required this.dropDown,
    required this.likeIcon,
    required this.onTap,
    required this.onClick,
    required this.onShareTap,
  });

  final Size size;
  final String userName;
  final String userImage;
  final String time;
  final String postImageUrl;
  final int likes;
  final int comments;
  final List<String> tags;
  final String description;
  final Widget? dropDown;
  final Widget? likeIcon;
  final Function(String)? onTap;
  final Function()? onClick;
  final Function()? onShareTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.008),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xffEDB72B),
              radius: size.height * 0.031,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: size.height * 0.0294,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userImage),
                  radius: size.height * 0.028,
                ),
              ),
            ),
            title: Text(
              userName,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: 'AlbertSans',
                  color: const Color(0xff4A4A47),
                  fontSize: size.height * 0.0216),
            ),
            subtitle: Text(
              time,
              style: TextStyle(
                  fontFamily: 'AlbertSans',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xffA4A49D),
                  fontSize: size.height * 0.0145),
            ),
            trailing: dropDown,
          ),
          postImageUrl.isEmpty
              ? Container()
              : CachedNetworkImage(
                  imageUrl: postImageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.height * 0.024),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
          SizedBox(
            height: size.height * 0.006,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.035, vertical: size.height * 0.008),
            child: Text(
              description,
              style: TextStyle(
                  fontFamily: 'AlbertSans',
                  fontSize: size.height * 0.0175,
                  color: const Color(0xff4A4A47),
                  fontWeight: FontWeight.w400),
            ),
            // RichText(
            //   text: TextSpan(
            //     style: TextStyle(
            //         fontFamily: 'AlbertSans',
            //         fontSize: size.height * 0.0175,
            //         color: const Color(0xff4A4A47),
            //         fontWeight: FontWeight.w400),
            //     children: [
            //       const TextSpan(
            //           text:
            //               "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut faucibus quam. "),
            //       TextSpan(
            //         text: "Vestibulum ante ipsum",
            //         style: const TextStyle(
            //           color: Color(0xff3769EA),
            //           decoration: TextDecoration.underline,
            //         ),
            //         recognizer: TapGestureRecognizer()..onTap = () {},
            //       ),
            //       const TextSpan(text: " primis in "),
            //       TextSpan(
            //         text: "@faucibusorci ",
            //         style: const TextStyle(
            //             fontWeight: FontWeight.w600, color: Color(0xff0C0C0B)),
            //         recognizer: TapGestureRecognizer()..onTap = () {},
            //       ),
            //       const TextSpan(text: "luctus et name.")
            //     ],
            //   ),
            // ),
          ),
          SizedBox(
            height: size.height * 0.007,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.035, vertical: size.height * 0.005),
            child: SimpleTags(
              content: tags,
              wrapSpacing: -8,
              wrapRunSpacing: -8,
              onTagPress: onTap,
              tagContainerPadding: const EdgeInsets.all(6),
              tagTextStyle: TextStyle(
                  fontFamily: 'AlbertSans',
                  fontSize: size.height * 0.0175,
                  color: const Color(0xff0C0C0B),
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: size.height * 0.006,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
            ),
            child: Row(
              children: [
                likeIcon!,
                // SvgPicture.asset(
                //   'assets/svg/heart.svg',
                //   height: size.height * 0.03,
                // ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                Text(
                  likes.toString(),
                  style: TextStyle(
                    fontFamily: 'AlbertSans',
                    fontWeight: FontWeight.w600,
                    fontSize: size.height * 0.018,
                    color: const Color(0xff6B6B67),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.06,
                ),
                GestureDetector(
                  onTap: onClick,
                  child: SvgPicture.asset(
                    'assets/svg/chat_bubble.svg',
                    height: size.height * 0.03,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                Text(
                  comments.toString(),
                  style: TextStyle(
                    fontFamily: 'AlbertSans',
                    fontWeight: FontWeight.w600,
                    fontSize: size.height * 0.018,
                    color: const Color(0xff6B6B67),
                  ),
                ),
                // const SizedBox(
                //   width: 20,
                // ),
                const Spacer(),
                GestureDetector(
                  onTap: onShareTap,
                  child: SvgPicture.asset(
                    'assets/svg/Vector.svg',
                    height: size.height * 0.028,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          const Divider(
            thickness: 3,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
