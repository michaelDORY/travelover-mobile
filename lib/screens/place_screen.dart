import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/widgets/place_view.dart';
import 'package:travelover_mobile/widgets/comment.dart';
import 'package:unicons/unicons.dart';

class PlaceScreen extends StatelessWidget {
  const PlaceScreen({Key? key}) : super(key: key);

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
          title: const Text('Mario Adrion'),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: ListView(children: <Widget>[
              Column(children: [
                const PlaceView(
                  imagePath: 'assets/images/mario.jpg',
                  rating: 4.2,
                  address: 'Gay Townnn nnnnnnnnnnnn nnnnn nnnnnn nnnn',
                  title: 'Mario Adrionnn',
                  views: 6969,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 15.0,
                  ),
                  child: const Text(
                      "Софийский собор в Киеве — храм, в котором богослужения проводятся по графику. Один из символов украинской столицы фактически стал музеем. Молиться Богу здесь можно только в строго отведенные дни. Остальное время отведено для туристов и простых зевак.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.yellow,
                      )),
                ),
                Container(
                  height: 300.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/map.png'))),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 15.0,
                  ),
                  child: Column(children: [
                    const Text("Оцените это место",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.yellow,
                        )),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      IconButton(
                          icon: const Icon(
                            UniconsLine.favorite,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: const Icon(
                            UniconsLine.favorite,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: const Icon(
                            UniconsLine.favorite,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: const Icon(
                            UniconsLine.favorite,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: const Icon(
                            UniconsLine.favorite,
                            color: Colors.yellow,
                            size: 40,
                          ),
                          onPressed: () {}),
                    ]),
                  ]),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 15.0,
                  ),
                  child: Column(children: [
                    const Text("Комментарии",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.yellow,
                        )),
                    TextFormField(
                      autocorrect: false,
                      decoration: const InputDecoration(
                        icon: Icon(UniconsLine.edit_alt),
                        border: OutlineInputBorder(),
                        hintText: "Напишите саой комментарий здесь",
                      ),
                    ),
                  ]),
                ),
                const Comment(
                  imagePath: 'assets/images/mario.jpg',
                  commentText:
                      "Это невероятное место в самом центре города. Рекомендую каждому к посещению",
                )
              ])
            ])));
  }
}
