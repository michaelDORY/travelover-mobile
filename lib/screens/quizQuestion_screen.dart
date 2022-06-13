import 'package:flutter/material.dart';
import 'package:travelover_mobile/models/nav_buttons_data.dart';
import 'package:travelover_mobile/widgets/quizQuestion.dart';
import 'package:unicons/unicons.dart';

class quizQuestionScreen extends StatelessWidget {
  const quizQuestionScreen({Key? key}) : super(key: key);

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
              const QuizQuestion(
                textQuestion: 'Как назівается столица Франции?',
                Answer1: 'Лондон',
                Answer2: 'Киев',
                Answer3: 'Париж',
                Answer4: 'Прага',
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15.0,
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/quizEnd');
                    },
                    child: const Text("Следующий")),
              )
            ])));
  }
}
