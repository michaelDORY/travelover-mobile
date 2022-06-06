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
  String? val;
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
        ListTile(
          title: Text(widget.Answer1),
          leading: Radio(
            value: 1,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = value.toString();
              });
            },
            activeColor: Colors.white,
          ),
        ),
        ListTile(
          title: Text(widget.Answer2),
          leading: Radio(
            value: 2,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = value.toString();
              });
            },
            activeColor: Colors.green,
          ),
        ),
        ListTile(
          title: Text(widget.Answer3),
          leading: Radio(
            value: 3,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = value.toString();
              });
            },
            activeColor: Colors.green,
          ),
        ),
        ListTile(
          title: Text(widget.Answer4),
          leading: Radio(
            value: 4,
            groupValue: val,
            onChanged: (value) {
              setState(() {
                val = value.toString();
              });
            },
            activeColor: Colors.green,
          ),
        ),
      ]),
    );
  }
}
