import 'package:flutter/material.dart';
import 'package:travelover_mobile/widgets/quizQuestion.dart';

class quizQuestionScreen extends StatefulWidget {
  final String quiz_id;
  final List<dynamic> questions;
  const quizQuestionScreen(
      {Key? key, required this.quiz_id, required this.questions})
      : super(key: key);

  @override
  State<quizQuestionScreen> createState() => _quizQuestionScreenState();
}

class _quizQuestionScreenState extends State<quizQuestionScreen> {
  int index = 0;

  void nextQuestion() {
    if (index == widget.questions.length - 1) {
      Navigator.pushNamedAndRemoveUntil(context, '/quizEnd', (route) => true);
      Navigator.pushNamed(context, '/quizEnd');
    } else {
      setState(() {
        index++;
      });
    }
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
              title: widget.questions[index]["title"],
              incorrectAnswers: widget.questions[index]["incorrectAnswers"],
              rightAnswer: widget.questions[index]["rightAnswer"],
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
            onPressed: nextQuestion,
            child: const Text("Следующий")),
      ),
    );
  }
}
