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
    return Column(children: [
      Text(widget.textQuestion,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.yellow,
            fontWeight: FontWeight.w800,
          )),
      const SizedBox(
        height: 50.0,
      ),
      SizedBox(
          width: 600.0,
          height: 300.0,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 7.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2.0),
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                ),
                child: RadioListTile<int>(
                    value: 1,
                    groupValue: selectedValue,
                    activeColor: Colors.yellow,
                    title: Text(widget.Answer1),
                    onChanged: (value) => setState(() => selectedValue = 1)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 7.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2.0),
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                ),
                child: RadioListTile<int>(
                    value: 2,
                    activeColor: Colors.yellow,
                    groupValue: selectedValue,
                    title: Text(widget.Answer2),
                    onChanged: (value) => setState(() => selectedValue = 2)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 7.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2.0),
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                ),
                child: RadioListTile<int>(
                    value: 3,
                    activeColor: Colors.yellow,
                    groupValue: selectedValue,
                    title: Text(widget.Answer3),
                    onChanged: (value) => setState(() => selectedValue = 3)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 7.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2.0),
                  borderRadius:
                      const BorderRadius.all(const Radius.circular(25.0)),
                ),
                child: RadioListTile<int>(
                    value: 4,
                    activeColor: Colors.yellow,
                    groupValue: selectedValue,
                    title: Text(widget.Answer4),
                    onChanged: (value) => setState(() => selectedValue = 4)),
              ),
            ],
          ))
    ]);
  }
}
