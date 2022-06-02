import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:unicons/unicons.dart';

class QuizEnd extends StatelessWidget {
  const QuizEnd({Key? key}) : super(key: key);

  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const MenuScreen()),
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
          title: const Text('Результат'),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: Column(children: [
              const SizedBox(
                height: 50.0,
              ),
              const Text("Вы набрали 95% - это больше чем 99% пользователей",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.yellow,
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(
                height: 70.0,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15.0,
                ),
                child: Column(children: [
                  const Text("ПОДЕЛИТЕСЬ СВОИМ РЕЗУЛЬТАТОМ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
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
                ]),
              ),
              const SizedBox(
                height: 120.0,
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
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text("Главная")),
              )
            ])));
  }
}
