// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:unicons/unicons.dart';

import '../widgets/nav_button.dart';

class premiumScreen extends StatelessWidget {
  const premiumScreen({Key? key}) : super(key: key);

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
          title: const Text('Premium'),
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
                  const Text("\$60/Месяц",
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
                        Row(children: <Widget>[
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
                            child: const Text(
                                "Наше приложение имеет множество преимуществ при покупке подписки. Одно из них — доступ к комментариям, где Вы сможете оставлять свои впечатления от места, а так же смотреть на отзывы от других об этом же месте.",
                                textAlign: TextAlign.justify,
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
                          ),
                          Container(
                            width: 310,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 15.0,
                            ),
                            child: const Text(
                                "Возможность добавлять понравив-шейся место в 'Избранное', а так же его удалять.",
                                textAlign: TextAlign.justify,
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
                          ),
                          Container(
                            width: 310,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 15.0,
                            ),
                            child: const Text(
                                "Возможность редактирования про-филя улучшит ваш профиль.",
                                textAlign: TextAlign.justify,
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
                          ),
                          Container(
                            width: 310,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 15.0,
                            ),
                            child: const Text(
                                "Неограниченный доступ к премиум-квизам, а так же возможность делиться результатом квиза в социальных сетях.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.yellow,
                                )),
                          ),
                        ]),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 20.0,
                          ),
                          child: NavButton(
                              icon: UniconsLine.unlock_alt,
                              title: 'Купить',
                              subTitle: 'Месячный план',
                              path: '/'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ])));
  }
}
