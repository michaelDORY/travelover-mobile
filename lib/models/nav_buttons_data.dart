import 'package:travelover_mobile/widgets/nav_button.dart';
import 'package:unicons/unicons.dart';

class NavButtonsData {
  final _menuButtons = [
    NavButton(
      icon: UniconsLine.dollar_alt,
      title: 'Премиум подписка',
      subTitle: 'Нужно больше функций?',
      path: '',
    ),
    NavButton(
      icon: UniconsLine.book_alt,
      title: 'Пройти квизы',
      subTitle: 'Проверить свои знания',
      path: '/quizes',
    ),
    NavButton(
      icon: UniconsLine.location_point,
      title: 'Исследовать мир',
      subTitle: 'Нужна идея куда поехать?',
      path: '',
    ),
    NavButton(
      icon: UniconsLine.heart_alt,
      title: 'Избранные места',
      subTitle: 'Посмотри свои местечки',
      path: '',
    ),
  ];

  final _userButtons = <NavButton>[
    NavButton(
        icon: UniconsLine.language,
        title: 'Язык',
        subTitle: 'Русский',
        path: '/googleAuth'),
    NavButton(
        icon: UniconsLine.envelope,
        title: 'Почта',
        subTitle: 'example@gmail.com',
        path: '/email'),
    NavButton(
        icon: UniconsLine.comments,
        title: 'Необходима помощь?',
        subTitle: 'Поддержка',
        path: '/support')
  ];

  List<NavButton> get menuButtons => [..._menuButtons];
  List<NavButton> get userButtons => [..._userButtons];
}
