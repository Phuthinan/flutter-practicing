import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_1/cubit/app_cubit.dart';
import 'package:new_app_1/utils/colors.dart';
import 'package:new_app_1/widgets/large_text.dart';
import 'package:new_app_1/widgets/responsive_button.dart';
import 'package:new_app_1/widgets/small_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "wall1.jpg",
    "wall2.jpg",
    "wall3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/${images[index]}"),
                      fit: BoxFit.cover)),
              child: Container(
                margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LargeText(
                          text: "Trip",
                          size: 30,
                        ),
                        SmallText(
                          text: "Mountain",
                          size: 30,
                        ),
                        SizedBox(height: 20),
                        Container(
                            width: 250,
                            child: SmallText(
                                text:
                                    "Mountain hikes give you an incredible sense of freedom along with endurance tests")),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: (() {
                            BlocProvider.of<AppCubits>(context).getData();
                          }),
                          child: Container(
                              width: 200,
                              child: Row(
                                children: [
                                  ResponsiveButton(width: 120),
                                ],
                              )),
                        )
                      ],
                    ),
                    Column(
                        children: List.generate(3, (indexDot) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 4),
                        width: 8,
                        height: index == indexDot ? 25 : 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexDot
                                ? AppColors.mainColor
                                : Color.fromARGB(137, 138, 138, 138)),
                      );
                    }))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
