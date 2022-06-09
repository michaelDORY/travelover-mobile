import 'package:flutter/material.dart';
import 'package:travelover_mobile/models/place.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/services/firestore.dart';
import 'package:travelover_mobile/widgets/card_list.dart';
import 'package:travelover_mobile/widgets/error_boundary.dart';
import 'package:travelover_mobile/widgets/filter_sort_button.dart';
import 'package:travelover_mobile/widgets/loader.dart';
import 'package:travelover_mobile/widgets/place_card.dart';
import 'package:travelover_mobile/widgets/search_field.dart';
import 'package:unicons/unicons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

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
          title: const Text('Исследовать мир'),
        ),
        body: StreamBuilder<List<Place>>(
          stream: Firestore().getPlaces(),
          builder: (BuildContext context, AsyncSnapshot<List<Place>> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return _buildBody(context, snapshot.requireData);
              }
              return ErrorBoundary();
            }
            return const Loader();
          },
        ));
  }

  Widget _buildBody(BuildContext context, List<Place> places) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15.0,
      ),
      child: Column(children: [
        Container(width: 270.0, child: SearchField()),
        const SizedBox(
          height: 25.0,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            FilterSortButton(onPressed: () {}, title: "Фильтровать"),
            FilterSortButton(onPressed: () {}, title: "Сортировать"),
          ],
        ),
        const SizedBox(
          height: 25.0,
        ),
        CardList(
          title: 'Украина',
          cards: _buildPlaceCards(context, places),
        )
      ]),
    );
  }

  List<PlaceCard> _buildPlaceCards(BuildContext context, List<Place> list) {
    return list
        .map((place) => PlaceCard(
              address: place.address,
              description: place.description,
              imagePath: place.imagePath,
              rating: 200,
              title: place.title,
              views: place.views,
            ))
        .toList();
  }
}
