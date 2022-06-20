import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/widgets/card_list.dart';
import 'package:travelover_mobile/widgets/quiz_card.dart';
import 'package:unicons/unicons.dart';
import 'package:travelover_mobile/models/quiz.dart';
import 'package:travelover_mobile/services/firestore.dart';
import 'package:travelover_mobile/widgets/error_boundary.dart';
import 'package:travelover_mobile/widgets/loader.dart';

class QuizesScreen extends StatelessWidget {
  const QuizesScreen({Key? key}) : super(key: key);

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
          title: const Text('Quizes'),
        ),
        body: StreamBuilder<List<Quiz>>(
          stream: Firestore().getQuizes(),
          builder: (BuildContext context, AsyncSnapshot<List<Quiz>> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return _buildBody(context, snapshot.requireData);
              }
              return const ErrorBoundary();
            }
            return const Loader();
          },
        ));
  }

  Widget _buildBody(BuildContext context, List<Quiz> quizes) {
    final List<Map<String, dynamic>> sortedQuizes = _getSortedQuizes(quizes);
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15.0,
      ),
      child: Column(children: [
        SizedBox(
          width: 600.0,
          height: 530.0,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: sortedQuizes
                .map((obj) => Column(children: [
                      CardList(
                        title: obj['section'],
                        cards: _buildQuizCards(context, obj['quizes']),
                      ),
                      const SizedBox(
                        height: 25.0,
                      )
                    ]))
                .toList(),
          ),
        )
      ]),
    );
  }

  List<Map<String, dynamic>> _getSortedQuizes(List<Quiz> quizes) {
    List<Map<String, dynamic>> sortedQuizes = [];
    quizes.forEach((quiz) {
      int indexOfObject = sortedQuizes
          .indexWhere((element) => element['section'] == quiz.section);
      if (indexOfObject != -1) {
        sortedQuizes[indexOfObject]['quizes'].add(quiz);
      } else {
        sortedQuizes.add({
          'section': quiz.section,
          'quizes': [quiz]
        });
      }
    });
    return sortedQuizes;
  }

  List<QuizCard> _buildQuizCards(BuildContext context, List<Quiz> list) {
    return list.map((quiz) {
      return QuizCard(
        isTapable: true,
        quiz_id: quiz.quizId,
        title: quiz.nameOfQuiz,
        description: quiz.description,
        imagePath: quiz.image,
        questions: quiz.questions,
        time: quiz.time,
      );
    }).toList();
  }
}
