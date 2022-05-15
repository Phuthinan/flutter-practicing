import 'package:flutter/material.dart';
import 'package:kafe/widgets/text/name_text.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: NameText(text: "Project")));
  }
}
