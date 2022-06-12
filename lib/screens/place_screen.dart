import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/widgets/place_card.dart';
import 'package:travelover_mobile/widgets/comment.dart';
import 'package:unicons/unicons.dart';

class PlaceScreen extends StatefulWidget {
  final String placeId;
  final String imageUrl;
  final String imagePath;
  final Map<String, dynamic> rating;
  final int views;
  final String title;
  final String address;
  final String description;
  final BuildContext context;

  const PlaceScreen(
      {Key? key,
      required this.context,
      required this.imageUrl,
      required this.rating,
      required this.views,
      required this.title,
      required this.address,
      required this.description,
      required this.placeId,
      required this.imagePath})
      : super(key: key);

  @override
  State<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends State<PlaceScreen> {
  final filledStars = 0;

  @override
  void initState() {
    super.initState();
  }

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
          title: Text(widget.title),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: ListView(children: <Widget>[
              Column(children: [
                PlaceCard(
                  isTapable: false,
                  rating: widget.rating,
                  address: widget.address,
                  title: widget.title,
                  views: widget.views,
                  context: context,
                  placeId: widget.placeId,
                  imagePath: widget.imagePath,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 15.0,
                  ),
                  child: Text(widget.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.yellow,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Address',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 15.0,
                  ),
                  child: Text(
                    widget.address,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 10.0,
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
