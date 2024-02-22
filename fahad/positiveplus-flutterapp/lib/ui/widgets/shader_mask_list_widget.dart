import 'package:flutter/material.dart';

class ShaderMaskList extends StatelessWidget {
  const ShaderMaskList({
    super.key,
    required this.size,
    required this.list,
  });

  final Size size;
  final Widget list;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
            Colors.pink
          ],
          stops: [
            0.0,
            0.1,
            0.9,
            1.0
          ], // 10% purple, 80% transparent, 10% purple
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: list,
    );
  }
}
