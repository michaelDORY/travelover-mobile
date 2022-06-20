import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/screens/quizQuestion_screen.dart';
import 'package:unicons/unicons.dart';

class QuizDescription extends StatefulWidget {
  final String quiz_id;
  final String title;
  final String description;
  final String time;
  final List<dynamic> questions;
  const QuizDescription({
    Key? key,
    required this.title,
    required this.quiz_id,
    required this.description,
    required this.time,
    required this.questions,
  }) : super(key: key);

  @override
  State<QuizDescription> createState() => _QuizDescriptionState();
}

class _QuizDescriptionState extends State<QuizDescription> {
  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const MenuScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => _menuOpen(context),
              icon: const Icon(UniconsLine.bars))
        ],
        title: const Text('Quiz'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        child: Column(children: [
          Text(widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.yellow,
                fontWeight: FontWeight.w800,
              )),
          const SizedBox(
            height: 30.0,
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 15.0,
              ),
              child: Column(
                children: [
                  Row(children: <Widget>[
                    const Icon(
                      UniconsLine.check_circle,
                      color: Colors.yellow,
                      size: 40,
                    ),
                    Container(
                      width: 310,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 15.0,
                      ),
                      child: Text(widget.description,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.yellow,
                          )),
                    ),
                  ]),
                  Row(children: <Widget>[
                    const Icon(
                      UniconsLine.clock,
                      color: Colors.yellow,
                      size: 40,
                    ),
                    Container(
                      width: 310,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 15.0,
                      ),
                      child: Text(widget.time,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.yellow,
                          )),
                    ),
                  ]),
                ],
              )),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 50.0,
        ),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => quizQuestionScreen(
                          quiz_id: widget.quiz_id,
                          questions: widget.questions))));
            },
            child: const Text("Начать")),
      ),
    );
  }
}
