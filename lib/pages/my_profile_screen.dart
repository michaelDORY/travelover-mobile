import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelover_mobile/pages/menu_screen.dart';
import 'package:travelover_mobile/models/nav_buttons_data.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:unicons/unicons.dart';

import '../widgets/nav_button.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MenuScreen()),
    );
  }

  void _logOut(BuildContext context) async {
    await AuthService().logOut();
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
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
        title: const Text(
          'Мой профиль',
          style: TextStyle(
            color: Colors.yellowAccent,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding:
            const EdgeInsets.only(top: 40, bottom: 70, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints.loose(Size.infinite),
                        margin: const EdgeInsets.all(15),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(120),
                          border: Border.all(
                            color: Colors.yellowAccent,
                            width: 0.2,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Form(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            autocorrect: false,
                            decoration: const InputDecoration(
                              icon: Icon(UniconsLine.edit_alt),
                              border: OutlineInputBorder(),
                              hintText: "ФИО",
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ...NavButtonsData()
                              .menuButtons
                              .map((item) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: item))
                              .toList(),
                        ],
                      ),
                    ),
                    OutlinedButton(
                        onPressed: () => _logOut(context),
                        child: Text('LogOut'))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}