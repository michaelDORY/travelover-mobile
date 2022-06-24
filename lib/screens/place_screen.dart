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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlaceScreen extends StatefulWidget {
  final String placeId;
  final String imageUrl;
  final String imagePath;
  final Map<String, dynamic> rating;
  final int views;
  final String title;
  final Map<String, dynamic> address;
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
  Map<String, dynamic> _placeRating = {'mark': 0, 'users': 0};
  int? _placeViews;
  bool _isRatingSending = false;
  int filledStars = 0;
  late AuthBase Auth;

  final TextEditingController _textFieldController = TextEditingController();
  String commentText = '';
  List<dynamic> comments = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _placeRating = widget.rating;
    });
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
    Firestore().viewPlace(Auth.currentUser!.uid, widget.placeId).then((value) {
      setState(() {
        _placeViews = widget.views + value;
      });
    });
  }

  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MenuScreen()),
    );
  }

  void updateRating(int newRating) async {
    setState(() {
      _isRatingSending = true;
    });
    if (newRating != filledStars) {
      int oldUserRating = filledStars;
      setState(() {
        filledStars = newRating;
      });
      Map<String, dynamic> newPlaceRating = await Firestore().updatePlaceRating(
          oldUserRating: oldUserRating,
          newUserRating: newRating,
          oldMark: _placeRating['mark'].toDouble(),
          placeId: widget.placeId,
          usersCount: _placeRating['users']);
      await Firestore().updateUserPlaceRating(
          Auth.currentUser!.uid, widget.placeId, newRating);
      setState(() {
        _placeRating = newPlaceRating;
      });
    }
    setState(() {
      _isRatingSending = false;
    });
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
                  rating: _placeRating,
                  address: widget.address,
                  title: widget.title,
                  views: _placeViews != null ? _placeViews! : widget.views,
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
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.yellow,
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  AppLocalizations.of(context).address,
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
                    widget.address['description'],
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
                    Text(AppLocalizations.of(context).rate,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
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
                      padding: EdgeInsets.all(8.0),
                      child: Text(AppLocalizations.of(context).comm,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.yellow,
                          )),
                    ),
                    ElevatedButton(
                        child: Text(AppLocalizations.of(context).addComm),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
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
            title: Text(AppLocalizations.of(context).addYourComm),
            content: TextField(
              onChanged: (value) {
                commentText = value;
              },
              controller: _textFieldController,
              decoration:
                  InputDecoration(hintText: AppLocalizations.of(context).comm),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text(AppLocalizations.of(context).add),
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
      filledStarsList.add(StarIconButton(
          isFilled: true,
          isDisabled: _isRatingSending,
          onPressed: () => updateRating(i)));
    }
    for (int i = filledStars + 1; i <= 5; i++) {
      outlinedStarsList.add(StarIconButton(
          isFilled: false,
          isDisabled: _isRatingSending,
          onPressed: () => updateRating(i)));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [...filledStarsList, ...outlinedStarsList]);
  }
}
