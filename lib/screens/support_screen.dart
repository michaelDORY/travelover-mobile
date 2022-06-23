// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:unicons/unicons.dart';

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
          title: const Text('Почта'),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: Column(children: [
              const SizedBox(
                height: 15.0,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis aliquam id id in pharetra lorem. Purus tortor velit sed consequat urna, ipsum. Sit nullam ultrices sed morbi sed. Et blandit commodo vel blandit praesent sed donec ultrices a. Vel, laoreet in et quam elit, sed viverra faucibus. Proin nisi amet urna purus vivamus felis cursus nulla. ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.yellow,
                    )),
              ),
              const SizedBox(
                height: 50.0,
              ),
              const Text("Связь с нами",
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
