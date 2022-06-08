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
  bool _flag1 = true;
  bool _flag2 = true;
  bool _flag3 = true;
  bool _flag4 = true;

  @override
  Widget build(BuildContext context) {
    final ButtonLanEnglish = ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        primary: _flag1
            ? Colors.yellow
            : Color.fromARGB(255, 168, 166, 37), // This is what you need!
      ),
      onPressed: () => setState(() => _flag1 = !_flag1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('English'),
        ],
      ),
    );

    final ButtonLanRus = ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        primary: _flag2
            ? Colors.yellow
            : Color.fromARGB(255, 168, 166, 37), // This is what you need!
      ),
      onPressed: () => setState(() => _flag2 = !_flag2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Русский'),
        ],
      ),
    );

    final ButtonLanJapan = ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        primary: _flag3
            ? Colors.yellow
            : Color.fromARGB(255, 168, 166, 37), // This is what you need!
      ),
      onPressed: () => setState(() => _flag3 = !_flag3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("日本"),
        ],
      ),
    );

    final ButtonLanUA = ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        primary: _flag4
            ? Colors.yellow
            : Color.fromARGB(255, 168, 166, 37), // This is what you need!
      ),
      onPressed: () => setState(() => _flag4 = !_flag4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Украинска'),
        ],
      ),
    );

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
                      const SizedBox(
                        height: 25,
                      ),
                      ButtonLanEnglish,
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonLanRus,
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonLanJapan,
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonLanUA,
                      const SizedBox(
                        height: 150,
                      ),
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
