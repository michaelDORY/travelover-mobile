import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class PlaceCard extends StatefulWidget {
  final String imageUrl;
  final double rating;
  final int views;
  final String title;
  final String address;
  final String description;
  const PlaceCard(
      {Key? key,
      required this.imageUrl,
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
  bool _isFavourite = false;

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
                      fit: BoxFit.cover, image: NetworkImage(widget.imageUrl))),
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
}
