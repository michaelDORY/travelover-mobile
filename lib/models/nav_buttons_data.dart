import 'package:travelover_mobile/widgets/nav_button.dart';
import 'package:unicons/unicons.dart';

class NavButtonsData {
  final _menuButtons = [
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

  final _userButtons = <NavButton>[
    const NavButton(
        icon: UniconsLine.language,
        title: 'Язык',
        subTitle: 'Русский',
        path: '/googleAuth'),
    const NavButton(
        icon: UniconsLine.envelope,
        title: 'Почта',
        subTitle: 'example@gmail.com',
        path: '/googleAuth'),
    const NavButton(
        icon: UniconsLine.comments,
        title: 'Необходима помощь?',
        subTitle: 'Поддержка',
        path: '/googleAuth')
  ];

  List<NavButton> get menuButtons => [..._menuButtons];
  List<NavButton> get userButtons => [..._userButtons];
}
