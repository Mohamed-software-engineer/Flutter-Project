// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'dart:async';
import 'package:bookly/core/utiles/assts.dart';
import 'package:bookly/features/explor/presentation/screens/explor.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController1;
  late AnimationController animationController2;
  late Animation<Offset> textSlidingAnimation;
  late Animation<Offset> photoSlidingAnimation;

  @override
  void initState() {
    super.initState();
    initTextSlidingAnimation();
    initPhotoSlidingAnimation();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const ExplorScreen();
      }));
    });
  }
@override
void dispose()
{
  super.dispose();
  animationController1.dispose();
  animationController2.dispose();
}
  void initTextSlidingAnimation() {
    animationController1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    textSlidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: const Offset(0, 0))
            .animate(animationController1);
    animationController1.forward();
  }

  void initPhotoSlidingAnimation() {
    animationController2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    photoSlidingAnimation =
        Tween<Offset>(begin: const Offset(0, -4), end: const Offset(0, 0))
            .animate(animationController2);
    animationController2.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff100B20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SlideTransition(
              position: photoSlidingAnimation,
              child: Image.asset(AsstData.logo)),
          SlideTransition(
              position: textSlidingAnimation,
              child: const Center(
                child: Text(
                  "Read Free Books",
                  style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              )),
        ],
      ),
    );
  }
}
