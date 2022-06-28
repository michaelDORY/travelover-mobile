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
import 'package:travelover_mobile/widgets/search_field.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoutiteScreen extends StatefulWidget {
  const FavoutiteScreen({Key? key}) : super(key: key);

  @override
  State<FavoutiteScreen> createState() => _FavoutiteScreenState();
}

class _FavoutiteScreenState extends State<FavoutiteScreen> {
  List<Place> _favourites = [];
  bool _isLoading = true;

  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MenuScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthBase Auth = Provider.of<AuthBase>(context);
    Firestore().getUserFavourites(Auth.currentUser!.uid).then((value) {
      Firestore().getPlacesByIds(value).then((res) {
        setState(() {
          _favourites = res;
        });
      });
    }).whenComplete(() => setState(() {
          _isLoading = false;
        }));
    if (_isLoading) {
      return Loader();
    }
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => _menuOpen(context),
                icon: const Icon(UniconsLine.bars))
          ],
          title: Text(AppLocalizations.of(context).favPlaces),
        ),
        body: _buildBody(context, Auth));
  }

  Widget _buildBody(BuildContext context, AuthBase Auth) {
    if (_favourites.length == 0) {
      return Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              AppLocalizations.of(context).dontHaveFav,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/empty.jpg',
              height: 175,
              width: 350,
              fit: BoxFit.cover,
            ),
          )
        ],
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
                children: _favourites
                    .map(
                      (obj) => PlaceCard(
                        Auth: Auth,
                        isTapable: true,
                        rating: obj.rating,
                        address: obj.address,
                        title: obj.title,
                        views: obj.views,
                        context: context,
                        placeId: obj.placeId,
                        imagePath: obj.imagePath,
                      ),
                    )
                    .toList(),
              ),
            )));
  }
}
