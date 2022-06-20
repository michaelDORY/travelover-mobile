import 'package:flutter/material.dart';
import 'dart:math';

class QuizQuestion extends StatefulWidget {
  final String title;
  final String rightAnswer;
  final List<dynamic> incorrectAnswers;
  const QuizQuestion(
      {Key? key,
      required this.title,
      required this.rightAnswer,
      required this.incorrectAnswers})
      : super(key: key);

  @override
  State<QuizQuestion> createState() => _Question();
}

class _Question extends State<QuizQuestion> {
  String selectedValue = "";
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(widget.title,
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
        child: _buildRadioButton(),
      )
    ]);
  }

  Widget _buildRadioButton() {
    List<Widget> buttons = [];
    final List<dynamic> answers = [
      ...widget.incorrectAnswers,
      widget.rightAnswer
    ];
    List<int> list = [];
    while (list.length != 4) {
      int num = Random().nextInt(4);
      if (!list.contains(num)) {
        list.add(num);
        buttons.add(Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 7.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            ),
            child: RadioListTile<String>(
              value: answers[num],
              activeColor: Colors.yellow,
              groupValue: selectedValue,
              title: Text(answers[num]),
              onChanged: (value) => setState(() {
                selectedValue = answers[num];
              }),
            )));
      }
    }
    return ListView(children: buttons);
  }
}
