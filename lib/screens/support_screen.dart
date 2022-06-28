// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

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
          title: Text(AppLocalizations.of(context).support),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: Column(children: [
              const SizedBox(
                height: 70.0,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Text(AppLocalizations.of(context).supportText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.yellow,
                    )),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Text(AppLocalizations.of(context).contactUs,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.yellow,
                  )),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                    icon: const Icon(
                      UniconsLine.telegram_alt,
                      color: Colors.yellow,
                      size: 40,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: const Icon(
                      UniconsLine.facebook_f,
                      color: Colors.yellow,
                      size: 40,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: const Icon(
                      UniconsLine.instagram,
                      color: Colors.yellow,
                      size: 40,
                    ),
                    onPressed: () {}),
              ]),
            ])));
  }
}
