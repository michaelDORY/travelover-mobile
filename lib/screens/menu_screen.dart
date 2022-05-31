import 'package:flutter/material.dart';
import 'package:travelover_mobile/models/nav_buttons_data.dart';
import 'package:unicons/unicons.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: NavButtonsData()
                    .menuButtons
                    .map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: item))
                    .toList(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, '/user');
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
                  const Text('Мой профиль')
                ],
              )
            ],
          ),
        ));
  }
}
