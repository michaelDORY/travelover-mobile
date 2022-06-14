import 'package:flutter/material.dart';
import 'package:travelover_mobile/services/firebase_storage.dart';
import 'package:unicons/unicons.dart';

class QuizCard extends StatefulWidget {
  final bool isTapable;
  final String imagePath;
  final String title;
  final String description;
  const QuizCard(
      {Key? key,
      required this.isTapable,
      required this.imagePath,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  String imageUrl =
      "https://icons-for-free.com/iconfiles/png/512/maps+navigation+pin+place+icon-1320167831530096671.png";

  @override
  void initState() {
    super.initState();
    FStorage()
        .getFile(widget.imagePath)
        .then((value) => setState(() => {imageUrl = value}));
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

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      widget.isTapable
          ? GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/quizDesc');
              },
              child: _buildCard())
          : _buildCard(),
    ]);
  }

  @override
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
                  height: 200.0, width: double.infinity, fit: BoxFit.cover),
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
}
