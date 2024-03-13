import 'package:ayurvedic/utils/extenstion/svg_extension.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: double.infinity,
            child: Image.asset(
              'assets/images/vertical.png',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: height / 4.5,
              child: 'assets/logo_big.svg'.svgAsset,
            ),
          ),
        ],
      ),
    );
  }
}
