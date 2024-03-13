import 'package:ayurvedic/utils/extenstion/svg_extension.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bgm.png'),
          fit: BoxFit.fitWidth,
          alignment: Alignment.center,
        ),
      ),
      height: width / 2.0,
      child: Center(child: 'assets/logo.svg'.svgAsset),
    );
  }
}
