import 'dart:async';

import 'package:ayurvedic/presentation/screen/login_screen.dart';
import 'package:ayurvedic/utils/extenstion/svg_extension.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    timeToGo();
    super.initState();
  }

  Future<void> timeToGo() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ));
    });
  }

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
