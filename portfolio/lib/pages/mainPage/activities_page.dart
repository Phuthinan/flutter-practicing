import 'package:flutter/material.dart';
import 'package:kafe/widgets/text/name_text.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: NameText(text: "activity"),
      ),
    );
  }
}
