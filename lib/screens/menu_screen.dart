import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/models/nav_buttons_data.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:travelover_mobile/services/firestore.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<MenuScreen> createState() => _MenuScreenStateState();
}

class _MenuScreenStateState extends State<MenuScreen> {
  bool hasPremium = false;

  @override
  Widget build(BuildContext context) {
    AuthBase Auth = Provider.of<AuthBase>(context);
    Firestore().hasUserPremium(Auth.currentUser!.uid).then((value) {
      if (value == true) {
        setState(() {
          hasPremium = true;
        });
      }
    });
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(UniconsLine.times))
            ]),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                ...NavButtonsData()
                    .menuButtons
                    .map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: item))
                    .toList(),
                hasPremium ? Container() : NavButtonsData().premiumButton
              ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/user');
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20.0)),
                      child: const Icon(
                        UniconsLine.user,
                        size: 50.0,
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(AppLocalizations.of(context).myProfile),
                ],
              )
            ],
          ),
        ));
  }
}
