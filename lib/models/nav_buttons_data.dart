import 'package:travelover_mobile/widgets/nav_button.dart';
import 'package:unicons/unicons.dart';

class NavButtonsData {
  final _data = [
    const NavButton(
      icon: UniconsLine.dollar_alt,
      title: 'Премиум подписка',
      subTitle: 'Нужно больше функций?',
      path: '',
    ),
    const NavButton(
      icon: UniconsLine.book_alt,
      title: 'Пройти квизы',
      subTitle: 'Проверить свои знания',
      path: '',
    ),
    const NavButton(
      icon: UniconsLine.location_point,
      title: 'Исследовать мир',
      subTitle: 'Нужна идея куда поехать?',
      path: '',
    ),
    const NavButton(
      icon: UniconsLine.heart_alt,
      title: 'Избранные места',
      subTitle: 'Посмотри свои местечки',
      path: '',
    ),
  ];

  List<NavButton> get navButtons => [..._data];
}
