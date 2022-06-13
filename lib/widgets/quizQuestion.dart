import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class QuizQuestion extends StatefulWidget {
  final String textQuestion;
  final String Answer1;
  final String Answer2;
  final String Answer3;
  final String Answer4;
  const QuizQuestion(
      {Key? key,
      required this.textQuestion,
      required this.Answer1,
      required this.Answer2,
      required this.Answer3,
      required this.Answer4})
      : super(key: key);

  @override
  State<QuizQuestion> createState() => _Question();
}

class _Question extends State<QuizQuestion> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Text(widget.textQuestion,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.yellow,
              fontWeight: FontWeight.w800,
            )),
        const SizedBox(
          height: 20.0,
        ),
        Radio<int>(
          value: 1,
          groupValue: selectedValue,
          onChanged: (value) => setState(() => selectedValue = 1),
        )
      ]),
    );
  }
}
