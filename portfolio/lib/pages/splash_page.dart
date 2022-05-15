import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'main_page.dart';

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
    var appColors = AppColors;
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
      nextScreen: MainPage(),
      backgroundColor: AppColors.mainColor,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
