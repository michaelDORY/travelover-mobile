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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [...NavButtonsData().navButtons.toList()]),
      ),
    );
  }
}
