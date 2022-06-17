import 'package:flutter/material.dart';
import 'package:travelover_mobile/models/nav_buttons_data.dart';
import 'package:travelover_mobile/widgets/questions_widget.dart';
import 'package:travelover_mobile/widgets/quizQuestion.dart';
import 'package:unicons/unicons.dart';
import 'package:travelover_mobile/widgets/next_Questions.dart';

class quizQuestionScreen extends StatefulWidget {
  const quizQuestionScreen({Key? key}) : super(key: key);

  @override
  State<quizQuestionScreen> createState() => _quizQuestionScreenState();
}

class _quizQuestionScreenState extends State<quizQuestionScreen> {
  List<QuizQuestion> questions = [
    QuizQuestion(
        textQuestion: "Как называется столица Украины",
        Answer1: "Харьков",
        Answer2: "Киев",
        Answer3: "Лондон",
        Answer4: "Париж"),
    QuizQuestion(
        textQuestion: "Как называется столица Британии",
        Answer1: "Краков",
        Answer2: "Прага",
        Answer3: "Лондон",
        Answer4: "Венисуелла"),
    QuizQuestion(
        textQuestion: "Как называется столица Франции",
        Answer1: "Братислава",
        Answer2: "Львов",
        Answer3: "Гваделупа",
        Answer4: "Париж")
  ];

  int index = 0;

  void nextQuestion() {
    if (index == questions.length - 1) {
      Navigator.pushNamedAndRemoveUntil(context, '/quizEnd', (route) => true);
      // Navigator.pushNamed(context, '/quizEnd');
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int idexQuestion = index + 1;
    int totalquestions = questions.length;
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
              textQuestion: questions[index].textQuestion,
              Answer1: questions[index].Answer1,
              Answer2: questions[index].Answer2,
              Answer3: questions[index].Answer3,
              Answer4: questions[index].Answer4,
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
