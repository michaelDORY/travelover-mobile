import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/screens/quizQuestion_screen.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuizDescription extends StatefulWidget {
  final String quiz_id;
  final String imageUrl;
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
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<QuizDescription> createState() => _QuizDescriptionState();
}

class _QuizDescriptionState extends State<QuizDescription> {
  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MenuScreen()),
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
        title: Text(AppLocalizations.of(context).quiz),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        child: Column(children: [
          SizedBox(
              width: 600.0,
              height: 540.0,
              child: ListView(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(widget.imageUrl,
                        height: 150.0, width: 300.0, fit: BoxFit.cover),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.yellow,
                        fontWeight: FontWeight.w800,
                      )),
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
                      ))
                ],
              ))
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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: ((context) => quizQuestionScreen(
                        quiz_id: widget.quiz_id, questions: widget.questions))),
                (route) => false,
              );
            },
            child: Text(AppLocalizations.of(context).start)),
      ),
    );
  }
}
