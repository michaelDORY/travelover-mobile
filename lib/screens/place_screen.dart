import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:travelover_mobile/services/firestore.dart';
import 'package:travelover_mobile/utils/toast.dart';
import 'package:travelover_mobile/widgets/place_card.dart';
import 'package:travelover_mobile/widgets/comment.dart';
import 'package:travelover_mobile/widgets/star_icon_button.dart';
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
  int filledStars = 0;
  late AuthBase Auth;

  TextEditingController _textFieldController = new TextEditingController();
  String commentText = '';
  List<dynamic> comments = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      Auth = Provider.of<AuthBase>(widget.context);
    });
    Firestore()
        .getUserRatingForPlace(Auth.currentUser!.uid, widget.placeId)
        .then((value) => setState(() {
              filledStars = value;
            }));
    Firestore().getPlaceComments(widget.placeId).then((value) {
      print(value);
      setState(() {
        comments = value;
      });
    });
    CustomToast(color: Colors.green, message: 'Wait till approving').show();
  }

  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const MenuScreen()),
    );
  }

  void updateRating(int newRating) async {
    if (newRating != filledStars) {
      setState(() {
        filledStars = newRating;
      });
      await Firestore().updateUserPlaceRating(
          Auth.currentUser!.uid, widget.placeId, newRating);
    }
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
                  Auth: Auth,
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
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 15.0,
                  ),
                  child: Column(children: [
                    const Text("Rate the place",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.yellow,
                        )),
                    _buildRatingStars(filledStars)
                  ]),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 15.0,
                  ),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text("Comments",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.yellow,
                          )),
                    ),
                    ElevatedButton(
                        child: Text('Add comment'),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30)),
                        onPressed: () => _showPopup())
                  ]),
                ),
                ...comments.map((item) => Comment(
                      commentText: item['comment'],
                      imagePath: item['avatarUrl'],
                    ))
              ])
            ])));
  }

  Future _showPopup() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add your comment'),
            content: TextField(
              onChanged: (value) {
                commentText = value;
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Comment..."),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Add'),
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
                onPressed: () {
                  if (commentText != '') {
                    Firestore()
                        .addComment(
                            comment: commentText,
                            place_id: widget.placeId,
                            place_name: widget.title,
                            user_email: Auth.currentUser!.email ?? '',
                            user_id: Auth.currentUser!.uid)
                        .then((value) => CustomToast(
                                color: Colors.green,
                                message: 'Wait till approving')
                            .show());
                  }
                  _textFieldController.clear();
                  setState(() {
                    commentText = '';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Widget _buildRatingStars(int filledStars) {
    List<StarIconButton> filledStarsList = [];
    List<StarIconButton> outlinedStarsList = [];
    for (int i = 1; i <= filledStars; i++) {
      filledStarsList.add(
          StarIconButton(isFilled: true, onPressed: () => updateRating(i)));
    }
    for (int i = filledStars + 1; i <= 5; i++) {
      outlinedStarsList.add(
          StarIconButton(isFilled: false, onPressed: () => updateRating(i)));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [...filledStarsList, ...outlinedStarsList]);
  }
}
