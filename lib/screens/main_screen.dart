import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/models/place.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:travelover_mobile/services/firestore.dart';
import 'package:travelover_mobile/widgets/card_list.dart';
import 'package:travelover_mobile/widgets/error_boundary.dart';
import 'package:travelover_mobile/widgets/loader.dart';
import 'package:travelover_mobile/widgets/place_card.dart';
import 'package:travelover_mobile/widgets/search_bar.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? searchTerm;

  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MenuScreen()),
    );
  }

  void updateSearchTerm(String newTerm) {
    setState(() {
      searchTerm = newTerm;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthBase Auth = Provider.of<AuthBase>(context);

    return Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => _menuOpen(context),
                icon: const Icon(UniconsLine.bars))
          ],
          title: Text(AppLocalizations.of(context).discover),
        ),
        body: StreamBuilder<List<Place>>(
          stream: Firestore().getPlaces(),
          builder: (BuildContext context, AsyncSnapshot<List<Place>> snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return _buildTemplate(context, Auth, snapshot.requireData);
              }
              return ErrorBoundary();
            }
            return const Loader();
          },
        ));
  }

  Widget _buildTemplate(
      BuildContext context, AuthBase Auth, List<Place> places) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            _buildSearchBar(),
            searchTerm == null || searchTerm!.isEmpty
                ? _buildBody(context, Auth, places)
                : _buildSearchResult(context, Auth, places)
          ],
        ));
  }

  Widget _buildSearchBar() {
    return Container(
        width: 270.0,
        height: 70,
        child: SearchBar(
          term: searchTerm,
          onSubmit: updateSearchTerm,
        ));
  }

  Widget _buildSearchResult(
      BuildContext context, AuthBase Auth, List<Place> places) {
    final List<Place> searchedPlaces = _getSearchedPlaces(places, searchTerm!);

    if (searchedPlaces.isEmpty) {
      return Center(
          child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text(
          AppLocalizations.of(context).nothingFound,
          style: Theme.of(context).textTheme.headline2,
        ),
      ));
    }

    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        child: SizedBox(
          height: 550.0,
          width: 250,
          child: Center(
            child: ListView(
                scrollDirection: Axis.vertical,
                children: _buildPlaceCards(context, Auth, searchedPlaces)),
          ),
        ));
  }

  Widget _buildBody(BuildContext context, AuthBase Auth, List<Place> places) {
    final List<Map<String, dynamic>> sortedPlaces = _getSortedPlaces(places);

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15.0,
      ),
      child: Column(children: [
        //Container(width: 270.0, child: SearchField()),
        // const SizedBox(
        //   height: 25.0,
        // ),
        // Wrap(
        //   spacing: 10,
        //   runSpacing: 10,
        //   children: [
        //     FilterSortButton(onPressed: () {}, title: "Filter"),
        //     FilterSortButton(onPressed: () {}, title: "Sort"),
        //   ],
        // ),
        const SizedBox(
          height: 25.0,
        ),
        SizedBox(
          width: 600.0,
          height: 530.0,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: sortedPlaces
                .map((obj) => Column(children: [
                      CardList(
                        title: obj['country'],
                        cards: _buildPlaceCards(context, Auth, obj['places']),
                      ),
                      SizedBox(
                        height: 25.0,
                      )
                    ]))
                .toList(),
          ),
        )
      ]),
    );
  }

  List<Place> _getSearchedPlaces(List<Place> places, String term) {
    List<Place> res = [];
    places.forEach((place) {
      String country = place.country.toLowerCase();
      String address = place.address['description'].toLowerCase();
      String title = place.title.toLowerCase();
      term = term.toLowerCase();
      if (country.contains(term) ||
          address.contains(term) ||
          title.contains(term)) {
        res.add(place);
      }
    });
    return res;
  }

  List<Map<String, dynamic>> _getSortedPlaces(List<Place> places) {
    List<Map<String, dynamic>> sortedPlaces = [];
    places.forEach((place) {
      int indexOfObject = sortedPlaces
          .indexWhere((element) => element['country'] == place.country);
      if (indexOfObject != -1) {
        sortedPlaces[indexOfObject]['places'].add(place);
      } else {
        sortedPlaces.add({
          'country': place.country,
          'places': [place]
        });
      }
    });
    return sortedPlaces;
  }

  List<PlaceCard> _buildPlaceCards(
      BuildContext context, AuthBase Auth, List<Place> list) {
    return list.map((place) {
      return PlaceCard(
        Auth: Auth,
        isTapable: true,
        context: context,
        placeId: place.placeId,
        address: place.address,
        description: place.description,
        rating: place.rating,
        title: place.title,
        views: place.views,
        imagePath: place.imagePath,
      );
    }).toList();
  }
}
