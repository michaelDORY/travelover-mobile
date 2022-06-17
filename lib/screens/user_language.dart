import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:unicons/unicons.dart';
import '../widgets/nav_button.dart';
import 'menu_screen.dart';

class UserLanguage extends StatefulWidget {
  const UserLanguage({Key? key}) : super(key: key);

  @override
  State<UserLanguage> createState() => _UserLanguageState();
}

void _menuOpen(context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => const MenuScreen()),
  );
}

class _UserLanguageState extends State<UserLanguage> {
  int selectedValue = 0;
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
          title: const Text('Язык'),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: Column(
              children: [
                const Text("Выберите подходящий язык",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w800,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                          width: 600.0,
                          height: 400.0,
                          child: ListView(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                  vertical: 7.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 2.0),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25.0)),
                                ),
                                child: RadioListTile<int>(
                                    value: 1,
                                    groupValue: selectedValue,
                                    activeColor: Colors.yellow,
                                    title: const Text('English'),
                                    onChanged: (value) =>
                                        setState(() => selectedValue = 1)),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                  vertical: 7.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 2.0),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25.0)),
                                ),
                                child: RadioListTile<int>(
                                    value: 2,
                                    activeColor: Colors.yellow,
                                    groupValue: selectedValue,
                                    title: const Text('Русский'),
                                    onChanged: (value) =>
                                        setState(() => selectedValue = 2)),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                  vertical: 7.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 2.0),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25.0)),
                                ),
                                child: RadioListTile<int>(
                                    value: 3,
                                    activeColor: Colors.yellow,
                                    groupValue: selectedValue,
                                    title: const Text("日本"),
                                    onChanged: (value) =>
                                        setState(() => selectedValue = 3)),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                  vertical: 7.0,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 2.0),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25.0)),
                                ),
                                child: RadioListTile<int>(
                                    value: 4,
                                    activeColor: Colors.yellow,
                                    groupValue: selectedValue,
                                    title: const Text('Украинска'),
                                    onChanged: (value) =>
                                        setState(() => selectedValue = 4)),
                              ),
                            ],
                          )),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 20.0,
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/quizEnd');
                            },
                            child: const Text("Подтвердить")),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
