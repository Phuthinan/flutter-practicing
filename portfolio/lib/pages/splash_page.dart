import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:kafe/pages/home_page.dart';
import 'package:kafe/utils/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // @override
  // void initState() {
  //   super.initState();
  //   _navigatetoHome();
  // }

  // void _navigatetoHome() async {
  //   await Future.delayed(Duration(milliseconds: 1500), () {});
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => HomePage()));
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: "assets/images/logo.png",
      splashIconSize: 300,
      // Center(
      //   child: Container(
      //     width: 600,
      //     height: 600,
      //     decoration: BoxDecoration(
      //         image:
      //             DecorationImage(image: AssetImage("assets/images/logo.png"))),
      //   ),
      // ),
      nextScreen: HomePage(),
      backgroundColor: AppColors.mainColor,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
