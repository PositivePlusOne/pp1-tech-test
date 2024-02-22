import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SliderContainer extends StatelessWidget {
  const SliderContainer({
    super.key,
    required this.size,
    this.color = const Color(0xffECACD0),
    this.recommendation = "U=U equals you and me ;)",
    this.userName = "@PositiveAndLoud",
    this.time = "12 Minutes Ago",
    this.userImage =
        "https://img.freepik.com/free-photo/portrait-man-laughing_23-2148859448.jpg?size=338&ext=jpg&ga=GA1.1.87170709.1707955200&semt=ais",
  });

  final Size size;
  final Color color;
  final String recommendation;
  final String userName;
  final String time;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 320,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(size.height * 0.03),
          bottomRight: Radius.circular(size.height * 0.03),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: size.height * 0.035,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.006,
          ),
          child: Row(
            children: [
              Text(
                "Recommended",
                style: TextStyle(
                    fontFamily: 'AlbertSans',
                    fontSize: size.height * 0.02,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff0C0C0B)),
              ),
              const Spacer(),
              SvgPicture.asset(
                'assets/svg/cancel.svg',
                height: size.height * 0.024,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
          ),
          child: Text(
            recommendation,
            style: TextStyle(
              fontFamily: 'BN',
              fontSize: size.height * 0.048,
              height: 1.15,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.height * 0.006,
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              radius: size.height * 0.03,
              child: CircleAvatar(
                backgroundColor: const Color(0xffECACD0),
                radius: size.height * 0.029,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userImage),
                  radius: size.height * 0.027,
                ),
              ),
            ),
            title: Text(
              userName,
              style: TextStyle(
                  fontFamily: 'AlbertSans',
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF202020),
                  fontSize: size.height * 0.022),
            ),
            subtitle: Text(
              time,
              style: TextStyle(
                  fontFamily: 'AlbertSans',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF7A7A7A),
                  fontSize: size.height * 0.0145),
            ),
          ),
        ),
      ]),
    );
  }
}
