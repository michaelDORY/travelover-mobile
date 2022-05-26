import 'package:flutter/material.dart';
import 'package:travelover_mobile/widgets/nav_button.dart';
import 'package:unicons/unicons.dart';

class NavButtonsData {
  final _data = [
    const NavButton(
      icon: Icon(UniconsLine.heart_alt),
      title: 'Премиум подписка',
      subTitle: 'Нужно больше функций?',
      path: '',
    ),
    const NavButton(
      icon: Icon(UniconsLine.book_alt),
      title: 'Пройти квизы',
      subTitle: 'Проверить свои знания',
      path: '',
    ),
  ];

  List<NavButton> get navButtons => [..._data];
}
