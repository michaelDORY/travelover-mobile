import 'package:flutter/material.dart';
import 'dart:math';

class QuizQuestion extends StatefulWidget {
  final String title;
  final String rightAnswer;
  final List<dynamic> incorrectAnswers;
  final List<dynamic> randomAnswers = [];
  QuizQuestion(
      {Key? key,
      required this.title,
      required this.rightAnswer,
      required this.incorrectAnswers})
      : super(key: key) {
    List<dynamic> answers = [...incorrectAnswers, rightAnswer];
    List<int> list = [];
    while (list.length != 4) {
      int num = Random().nextInt(4);
      if (!list.contains(num)) {
        list.add(num);
        randomAnswers.add(answers[num]);
      }
    }
  }

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
    for (int i = 0; i < 4; i++) {
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
            value: widget.randomAnswers[i],
            activeColor: Colors.yellow,
            groupValue: selectedValue,
            title: Text(widget.randomAnswers[i]),
            onChanged: (value) => setState(() {
              selectedValue = widget.randomAnswers[i];
            }),
          )));
    }
    return ListView(children: buttons);
  }
}
