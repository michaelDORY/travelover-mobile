import 'package:travelover_mobile/widgets/nav_button.dart';
import 'package:unicons/unicons.dart';

class NavButtonsData {
  final _menuButtons = [
    NavButton(
      icon: UniconsLine.dollar_alt,
      title: 'Premium',
      subTitle: 'Need more functions?',
      path: '/premiumSub',
    ),
    NavButton(
      icon: UniconsLine.book_alt,
      title: 'Take quizzes',
      subTitle: 'Check your knowladge',
      path: '/quizes',
    ),
    NavButton(
      icon: UniconsLine.location_point,
      title: 'Discover',
      subTitle: 'Need an idea where to go?',
      path: '/main',
    ),
    NavButton(
      icon: UniconsLine.heart_alt,
      title: 'Favourites',
      subTitle: 'Look at your places',
      path: '',
    ),
  ];

  final _userButtons = <NavButton>[
    NavButton(
        icon: UniconsLine.language,
        title: 'Language',
        subTitle: 'Enflish',
        path: '/UserLanguage'),
    NavButton(
        icon: UniconsLine.envelope,
        title: 'Email',
        subTitle: 'example@gmail.com',
        path: '/email'),
    NavButton(
        icon: UniconsLine.comments,
        title: 'Need help?',
        subTitle: 'Support',
        path: '/support')
  ];

  List<NavButton> get menuButtons => [..._menuButtons];
  List<NavButton> get userButtons => [..._userButtons];
}
