import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/quizEnd_screen.dart';
import 'package:travelover_mobile/widgets/quizQuestion.dart';
import 'dart:math';

class quizQuestionScreen extends StatefulWidget {
  final String quiz_id;
  final List<dynamic> questions;
  quizQuestionScreen({
    Key? key,
    required this.quiz_id,
    required this.questions,
  }) : super(key: key);

  @override
  State<quizQuestionScreen> createState() => _quizQuestionScreenState();
}

class _quizQuestionScreenState extends State<quizQuestionScreen> {
  int index = 0;
  String selectedValue = "";
  List<dynamic> randomAnswers = [];
  int result = 0;

  void nextQuestion() {
    if (index == widget.questions.length - 1) {
      double percent = (result / widget.questions.length) * 100;
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => QuizEnd(result: percent))));
    } else {
      setState(() {
        index++;
        randomizer();
      });
    }
  }

  void initState() {
    randomizer();
  }

  void setAnswer(String newValue) {
    setState(() {
      selectedValue = newValue;
    });
  }

  void randomizer() {
    List<dynamic> answers = [
      ...widget.questions[index]["incorrectAnswers"],
      widget.questions[index]["rightAnswer"]
    ];
    List<int> list = [];
    randomAnswers = [];
    while (list.length != 4) {
      int num = Random().nextInt(4);
      if (!list.contains(num)) {
        list.add(num);
        randomAnswers.add(answers[num]);
      }
    }
  }

  void markAnswer() {
    if (selectedValue == widget.questions[index]["rightAnswer"]) {
      result = result + 1;
    }
    nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    int idexQuestion = index + 1;
    int totalquestions = widget.questions.length;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Question: $idexQuestion / $totalquestions"),
      ),
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
          child: Column(children: [
            QuizQuestion(
              setAnswer: setAnswer,
              randomAnswers: randomAnswers,
              title: widget.questions[index]["title"],
            ),
          ])),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 60.0,
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: markAnswer,
            child: const Text("Следующий")),
      ),
    );
  }
}
