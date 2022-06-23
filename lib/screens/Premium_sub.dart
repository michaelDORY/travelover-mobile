// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/services/firestore.dart';
import 'package:travelover_mobile/widgets/nav_button.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:unicons/unicons.dart';

const List<String> BENEFITS = [
  "Our app has many benefits when you purchase a subscription. One of them is access to comments, where you can leave your impressions of the place, as well as look at reviews from others about the same place.",
  "Possibility to add the place you like to 'Favorites', as well as delete it.",
  "The ability to edit your profile will improve your profile.",
  "Unlimited access to premium quizzes, as well as the ability to share the result of the quiz on social networks."
];

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({Key? key}) : super(key: key);

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  late AuthBase Auth;
  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MenuScreen()),
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
          title: const Text('Premium'),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: ListView(children: <Widget>[
              Column(
                children: [
                  const Text("\$60/mounth",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.yellow,
                        fontWeight: FontWeight.w800,
                      )),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15.0,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        ...BENEFITS.map((value) => _buildBetefitItem(value)),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 20.0,
                          ),
                          child: NavButton(
                              icon: UniconsLine.unlock_alt,
                              title: 'Buy',
                              subTitle: 'Mounth plan',
                              action: () => _buyPopup()),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ])));
  }

  Future _buyPopup() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text('Premium activation'),
              content: const Text(
                  "Are you sure you want to activate the premium for \$60 per month?"),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: const Text('Activate'),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30)),
                      onPressed: () {
                        Auth = Provider.of<AuthBase>(context, listen: false);
                        Firestore().updatePremium(Auth.currentUser!.uid);
                        _successPopup();
                      },
                    ),
                    ElevatedButton(
                      child: const Text('Cancel'),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ]);
        });
  }

  Future _successPopup() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text('Premium activation'),
              content: const Text("You have successfully activated premium"),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: const Text('Okay'),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30)),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/', (route) => false);
                        ;
                      },
                    ),
                  ],
                )
              ]);
        });
  }

  Widget _buildBetefitItem(String text) {
    return Row(children: <Widget>[
      const Icon(
        UniconsLine.check_circle,
        color: Colors.yellow,
        size: 40,
      ),
      Container(
        width: 310,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 15.0,
        ),
        child: Text(text,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.yellow,
            )),
      ),
    ]);
  }
}
