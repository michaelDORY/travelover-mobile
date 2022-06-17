import 'package:flutter/material.dart';

class questionWidget extends StatelessWidget {
  const questionWidget(
      {Key? key,
      required this.question,
      required this.totalQuestions,
      required this.indexAction})
      : super(key: key);

  final String question;
  final int totalQuestions;
  final int indexAction;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text("Question: $indexAction + 1/$totalQuestions: $question"));
  }
}
