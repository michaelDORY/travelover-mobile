import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final String title;
  final List cards;
  const CardList({Key? key, required this.title, required this.cards})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: Theme.of(context).textTheme.headline2?.fontWeight,
                fontSize: Theme.of(context).textTheme.headline2?.fontSize,
                color: Theme.of(context).primaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cards.length,
              itemBuilder: (context, index) => cards[index],
            ),
          )
        ],
      ),
    );
  }
}
