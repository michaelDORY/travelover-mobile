import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:travelover_mobile/services/firebase_storage.dart';
import 'package:travelover_mobile/services/firestore.dart';
import 'package:unicons/unicons.dart';

class PlaceCard extends StatefulWidget {
  final String imagePath;
  final double rating;
  final int views;
  final String title;
  final String address;
  final String description;
  final AuthBase? auth;

  const PlaceCard(this.auth,
      {Key? key,
      required this.imagePath,
      required this.rating,
      required this.views,
      required this.title,
      required this.address,
      required this.description})
      : super(key: key);

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  List _favourites = [];
  bool _isFavourite = false;
  String imageUrl =
      "https://images.unsplash.com/photo-1555861496-0666c8981751?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";

  @override
  void initState() {
    super.initState();
    FStorage().getFile(widget.imagePath).then((value) => {
          setState(() {
            imageUrl = value;
          })
        });

    Firestore().fetchUser(widget.auth!.currentUser!.uid).then((user) {
      setState(() {
        _favourites = user!.favourites;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
            Container(
              alignment: Alignment.topRight,
              height: 150.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(imageUrl))),
              child: IconButton(
                  onPressed: () {
                    setState(() => {_isFavourite = !_isFavourite});
                  },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconTextGroup(UniconsLine.star, '${widget.rating}/5'),
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
                        widget.address,
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
                IconButton(
                    icon: const Icon(
                      UniconsLine.angle_right,
                      color: Colors.black,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/place');
                    }),
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
