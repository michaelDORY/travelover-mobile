// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/services/firestore.dart';
import 'package:travelover_mobile/widgets/nav_button.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    List<String> BENEFITS = [
      AppLocalizations.of(context).premiumSub1,
      AppLocalizations.of(context).premiumSub2,
      AppLocalizations.of(context).premiumSub3,
      AppLocalizations.of(context).premiumSub4,
    ];
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => _menuOpen(context),
                icon: const Icon(UniconsLine.bars))
          ],
          title: Text(AppLocalizations.of(context).premium),
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
                  Text(AppLocalizations.of(context).toPay,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
                              title: AppLocalizations.of(context).buy,
                              subTitle: AppLocalizations.of(context).mounthPlan,
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
              title: Text(AppLocalizations.of(context).premiumActivation),
              content: Text(AppLocalizations.of(context).areYouShure),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text(AppLocalizations.of(context).activate),
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
                      child: Text(AppLocalizations.of(context).cancel),
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
              title: Text(AppLocalizations.of(context).premiumActivation),
              content: Text(AppLocalizations.of(context).successActivation),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text(AppLocalizations.of(context).ok),
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
