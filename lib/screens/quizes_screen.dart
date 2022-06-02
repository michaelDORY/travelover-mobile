import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/widgets/card_list.dart';
import 'package:travelover_mobile/widgets/quiz_card.dart';
import 'package:unicons/unicons.dart';

class QuizesScreen extends StatelessWidget {
  const QuizesScreen({Key? key}) : super(key: key);

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
          title: const Text('Квизы'),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: ListView(children: <Widget>[
              Column(children: [
                CardList(
                  title: 'Языки',
                  cards: _getCardsLanguage(),
                ),
                CardList(
                  title: 'Культура',
                  cards: _getCardsCulture(),
                )
              ]),
            ])));
  }

  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const MenuScreen()),
    );
  }

  List _getCardsLanguage() {
    return [
      const QuizCard(
        imagePath: 'assets/images/Britain.jpeg',
        description: 'Этот квиз прошли 1209 человек',
        title: 'Английский',
      ),
      const QuizCard(
        imagePath: 'assets/images/Britain.jpeg',
        description: 'Этот квиз прошли 1209 человек',
        title: 'Итальянский',
      ),
      const QuizCard(
        imagePath: 'assets/images/Britain.jpeg',
        description: 'Этот квиз прошли 1209 человек',
        title: 'Японский',
      ),
    ];
  }

  List _getCardsCulture() {
    return [
      const QuizCard(
        imagePath: 'assets/images/Britain.jpeg',
        description: 'Этот квиз прошли 1209 человек',
        title: 'Анлгийская культура',
      ),
      const QuizCard(
        imagePath: 'assets/images/Britain.jpeg',
        description: 'Этот квиз прошли 1209 человек',
        title: 'Итальянская культура',
      ),
      const QuizCard(
        imagePath: 'assets/images/Britain.jpeg',
        description: 'Этот квиз прошли 1209 человек',
        title: 'Японская культура',
      ),
    ];
  }
}
