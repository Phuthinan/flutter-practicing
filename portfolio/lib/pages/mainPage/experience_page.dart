import 'package:flutter/material.dart';
import 'package:kafe/utils/colors.dart';
import 'package:kafe/widgets/text/name_text.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: NameText(text: "Experience"),
      ),
    );
    // Scaffold(
    //   body: CustomScrollView(
    //     slivers: [
    //       SliverAppBar(
    //         backgroundColor: AppColors.mainColor,
    //         expandedHeight: 300,
    //         flexibleSpace: FlexibleSpaceBar(
    //             background: Image.asset(
    //           "assets/images/profile.png",
    //           width: 150,
    //           height: 150,
    //           fit: BoxFit.scaleDown,
    //         )),
    //       )
    //     ],
    //   ),
    // );
  }
}
