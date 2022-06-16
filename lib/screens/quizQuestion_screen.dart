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
        Answer1: "Харьков",
        Answer2: "Киев",
        Answer3: "Лондон",
        Answer4: "Париж")
  ];

  int index = 0;
  void nextQuestion() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Результат'),
      ),
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
          child: Column(children: [
            questionWidget(
                question: questions[index].textQuestion,
                totalQuestions: questions.length,
                indexAction: index)
            // QuizQuestion()
            //   textQuestion: 'Как назівается столица Франции?',
            //   Answer1: 'Лондон',
            //   Answer2: 'Киев',
            //   Answer3: 'Париж',
            //   Answer4: 'Прага',
            // ),
          ])),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 60.0,
        ),
        child: NextQuestion(
          nextQuestion: nextQuestion,
        ),
      ),
    );
  }
}
