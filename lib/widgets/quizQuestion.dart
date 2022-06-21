import 'package:flutter/material.dart';

class QuizQuestion extends StatefulWidget {
  final String title;
  final Function setAnswer;
  final List<dynamic> randomAnswers;
  QuizQuestion(
      {Key? key,
      required this.title,
      required this.setAnswer,
      required this.randomAnswers})
      : super(key: key) {}

  @override
  State<QuizQuestion> createState() {
    return _Question();
  }
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
            onChanged: (value) {
              widget.setAnswer(value);
              setState(() {
                selectedValue = value ?? "";
              });
            },
          )));
    }
    return ListView(children: buttons);
  }
}
