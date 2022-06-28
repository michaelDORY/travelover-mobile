import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/screens/place_screen.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:travelover_mobile/services/firebase_storage.dart';
import 'package:travelover_mobile/services/firestore.dart';
import 'package:travelover_mobile/utils/toast.dart';
import 'package:unicons/unicons.dart';

class PlaceCard extends StatefulWidget {
  final AuthBase Auth;
  final bool isTapable;
  final String placeId;
  final String imagePath;
  final Map<String, dynamic> rating;
  final int views;
  final String title;
  final Map<String, dynamic> address;
  final String description;
  final BuildContext context;

  PlaceCard(
      {Key? key,
      required this.isTapable,
      required this.context,
      required this.imagePath,
      required this.rating,
      required this.views,
      required this.title,
      required this.address,
      this.description = "",
      required this.placeId,
      required this.Auth})
      : super(key: key);

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  List _favourites = [];
  bool _isFavourite = false;
  bool _isHeartLoading = true;
  String imageUrl =
      "https://icons-for-free.com/iconfiles/png/512/maps+navigation+pin+place+icon-1320167831530096671.png";

  @override
  void initState() {
    super.initState();

    FStorage()
        .getFile(widget.imagePath)
        .then((value) => setState(() => {imageUrl = value}));

    Firestore().fetchUser(widget.Auth.currentUser!.uid).then((user) {
      setState(() {
        _favourites = user!.favourites;
        _isHeartLoading = false;
      });

      if (_favourites.contains(widget.placeId)) {
        setState(() {
          _isFavourite = true;
          _isHeartLoading = false;
        });
      }
    }).catchError((e) {
      setState(() {
        _isHeartLoading = false;
      });
    });
  }

  void _toggleFavourite() async {
    try {
      if (_isFavourite) {
        setState(() {
          _isFavourite = false;
        });
        await Firestore().deletePlaceFromFavourites(
            widget.Auth.currentUser!.uid, widget.placeId);
      } else {
        setState(() {
          _isFavourite = true;
        });
        await Firestore()
            .addPlaceToFavourites(widget.Auth.currentUser!.uid, widget.placeId);
      }
    } on FirebaseException catch (e) {
      CustomToast();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget.isTapable
          ? GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PlaceScreen(
                              context: context,
                              imageUrl: imageUrl,
                              rating: widget.rating,
                              views: widget.views,
                              title: widget.title,
                              address: widget.address,
                              description: widget.description,
                              placeId: widget.placeId,
                              imagePath: widget.imagePath,
                            )));
              },
              child: _buildCard())
          : _buildCard(),
      Positioned(
        top: 15.0,
        right: 15.0,
        child: IconButton(
            onPressed: () => _isHeartLoading ? null : _toggleFavourite(),
            iconSize: 40,
            icon: _isFavourite
                ? Icon(
                    EvaIcons.heart,
                    color: Colors.pink[200],
                  )
                : Icon(
                    EvaIcons.heartOutline,
                    color: Colors.grey[300],
                  )),
      ),
    ]);
  }

  Widget _buildCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.yellow[100],
      child: Container(
        width: 250,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(imageUrl,
                  height: 150.0, width: double.infinity, fit: BoxFit.cover),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconTextGroup(
                    UniconsLine.star, '${widget.rating['mark']}/5'),
                _buildIconTextGroup(UniconsLine.eye, '${widget.views}'),
              ],
            ),
            Text(
              widget.title,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: Theme.of(context).textTheme.headline3?.fontWeight,
                  fontSize: Theme.of(context).textTheme.headline3?.fontSize,
                  color: Colors.black),
              maxLines: 1,
              softWrap: false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.address['description'],
                        maxLines: 1,
                        softWrap: true,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            decoration: TextDecoration.underline,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.description,
                        maxLines: 2,
                        softWrap: true,
                        style: const TextStyle(
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
                widget.isTapable
                    ? const Icon(
                        UniconsLine.angle_right,
                        color: Colors.black,
                        size: 40,
                      )
                    : Container(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIconTextGroup(icon, text) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey[700],
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
