import 'package:flutter/material.dart';
import 'package:travelover_mobile/pages/menu_screen.dart';
import 'package:travelover_mobile/widgets/card_list.dart';
import 'package:travelover_mobile/widgets/place_card.dart';
import 'package:unicons/unicons.dart';

class MainSCreen extends StatelessWidget {
  const MainSCreen({Key? key}) : super(key: key);

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
          title: const Text('Исследовать мир'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
          child: Column(children: [
            TextFormField(
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                  icon: Icon(UniconsLine.search),
                  filled: true,
                  fillColor: Color.fromARGB(255, 37, 37, 37),
                  hintText: "Эйфелева башня",
                  disabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Фильтровать'),
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      textStyle: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w700)),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Сортировать'),
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      textStyle: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w700)),
                )
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            CardList(
              title: 'Украина',
              cards: _getCards(),
            )
          ]),
        ));
  }

  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const MenuScreen()),
    );
  }

  List _getCards() {
    return [
      const PlaceCard(
        imagePath: 'assets/images/mario.jpg',
        rating: 4.2,
        address: 'Gay Townnn nnnnnnnnnnnn nnnnn nnnnnn nnnn',
        description: 'So hotttttt ttttt ttttt tttttttttttttt ttttttttt',
        title:
            'Mario Adrionnn nnnnnnnnnnnn nnnnnnnnnnn nnnn nnnn nnnnnnnnn nnnnnnnn nnnnnnnn nnnnnnnn',
        views: 6969,
      ),
      const PlaceCard(
        imagePath: 'assets/images/mario.jpg',
        rating: 4.2,
        address: 'Gay Town',
        description: 'So hot',
        title: 'Mario Adrion',
        views: 6969,
      ),
      const PlaceCard(
        imagePath: 'assets/images/mario.jpg',
        rating: 4.2,
        address: 'Gay Town',
        description: 'So hot',
        title: 'Mario Adrion',
        views: 6969,
      ),
    ];
  }
}
