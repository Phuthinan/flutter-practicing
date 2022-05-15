import 'package:flutter/material.dart';
import 'package:kafe/utils/colors.dart';
import 'package:kafe/widgets/icon_and_text.dart';
import 'package:kafe/widgets/text/paragraph_text.dart';
import 'package:kafe/widgets/text/name_text.dart';
import 'package:kafe/widgets/text/topic_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(children: [
        // head
        Stack(
          children: [
            //Background
            Container(
              width: double.maxFinite,
              height: 300,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
            ),
            //picture&name
            Center(
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        image: DecorationImage(
                            image: AssetImage("assets/images/profile.png"),
                            fit: BoxFit.cover),
                        // border:
                        //     Border.all(color: AppColors.greenlightColor, width: 10),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: NameText(
                      text: "Phuthinan Saengkitamorn",
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // statement
        Container(
          padding: EdgeInsets.all(20),
          width: double.maxFinite,
          // height: 140,
          color: Colors.white,
          child: ParagraphText(
              text:
                  "       I am recently graduated from Biomedical Engineering Mahidol University with second-class honors. At present, I am attentively self-study programming HTML, CSS, JavaScript, React, Flutter and, etc. Moreover, I have an experience to program in C, C++, C#, MATLAB, Python, Unity for class projects. I always learn new knowledge, technology, information, and skills."),
        ),
        Container(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            width: double.maxFinite,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopicText(text: "About me"),
                IconText(
                  icon: Icons.home,
                  text:
                      "50 Soi Phiphaksa2, Phadungdao Road, Samphanthawong, Samphanthawong, Bangkok 10100",
                ),
                IconText(icon: Icons.phone, text: "0841396465"),
                IconText(icon: Icons.email, text: "s.phuthinan@gmail.com"),
              ],
            )),
        Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            width: double.maxFinite,
            // height: 300,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopicText(text: "Education"),
                SizedBox(height: 5),
                TopicText(
                  text:
                      "Department of Biomedical Engineering, Mahidol University (2017-2021)",
                  size: 15,
                  color: AppColors.paraColor,
                ),
                SizedBox(height: 5),
                ParagraphText(text: "Bachelor’s Degree GPA 3.39/4.00"),
              ],
            )),
        SizedBox(height: 30)
      ])),
    );
  }
}
