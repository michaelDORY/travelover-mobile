import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:unicons/unicons.dart';

class QuizDescription extends StatelessWidget {
  const QuizDescription({Key? key}) : super(key: key);

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
          title: const Text('Квиз'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 15.0,
          ),
          child: Column(children: [
            const Text("Английский",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
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
                    Row(children: <Widget>[
                      const Icon(
                        UniconsLine.check_circle,
                        color: Colors.yellow,
                        size: 40,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      Container(
                        width: 310,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 15.0,
                        ),
                        child: const Text(
                            "Софийский собор в Киеве — храм, в котором богослужения проводятся по графику. ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.yellow,
                            )),
                      ),
                    ]),
                    Row(children: <Widget>[
                      const Icon(
                        UniconsLine.check_circle,
                        color: Colors.yellow,
                        size: 40,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      Container(
                        width: 310,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 15.0,
                        ),
                        child: const Text(
                            "Софийский собор в Киеве — храм, в котором богослужения проводятся по графику. ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.yellow,
                            )),
                      ),
                    ]),
                    Row(children: <Widget>[
                      const Icon(
                        UniconsLine.check_circle,
                        color: Colors.yellow,
                        size: 40,
                        semanticLabel:
                            'Text to announce in accessibility modes',
                      ),
                      Container(
                        width: 310,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 15.0,
                        ),
                        child: const Text(
                            "Софийский собор в Киеве — храм, в котором богослужения проводятся по графику. ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.yellow,
                            )),
                      ),
                    ]),
                  ],
                )),
            const SizedBox(
              height: 50.0,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15.0,
                ),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          UniconsLine.check_circle,
                          color: Colors.yellow,
                          size: 40,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        Text(" 45 min.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.yellow,
                            )),
                      ]),
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
                        child: const Text("Начать")),
                  )
                ])),
          ]),
        ));
  }
}
