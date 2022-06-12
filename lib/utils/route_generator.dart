// import 'package:flutter/material.dart';
// import 'package:travelover_mobile/screens/Premium_sub.dart';
// import 'package:travelover_mobile/screens/email_screen.dart';
// import 'package:travelover_mobile/screens/main_screen.dart';
// import 'package:travelover_mobile/screens/my_profile_screen.dart';
// import 'package:travelover_mobile/screens/place_screen.dart';
// import 'package:travelover_mobile/screens/quizDescription_screen.dart';
// import 'package:travelover_mobile/screens/quizEnd_screen.dart';
// import 'package:travelover_mobile/screens/quizes_screen.dart';
// import 'package:travelover_mobile/screens/sign_in_screen.dart';
// import 'package:travelover_mobile/screens/sign_up_screen.dart';
// import 'package:travelover_mobile/screens/support_screen.dart';
// import 'package:travelover_mobile/screens/user_language.dart';
// import 'package:travelover_mobile/widgets/error_boundary.dart';
// import 'package:travelover_mobile/widgets/root.dart';

// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final args = settings.arguments;

//     switch (settings.name) {
//       case ('/'):
//         return MaterialPageRoute(builder: (_) => Root());
//       case ('/main'):
//         return MaterialPageRoute(builder: (_) => MainScreen());
//       case ('/signIn'):
//         return MaterialPageRoute(builder: (_) => SignInScreen());
//       case ('/signUp'):
//         return MaterialPageRoute(builder: (_) => SignUpScreen());
//       case ('/user'):
//         return MaterialPageRoute(builder: (_) => MyProfile());
//       case ('/place'):
//         return MaterialPageRoute(builder: (_) => PlaceScreen());
//       case ('/quizes'):
//         return MaterialPageRoute(builder: (_) => QuizesScreen());
//       case ('/quizDesc'):
//         return MaterialPageRoute(builder: (_) => QuizDescription());
//       case ('/quizEnd'):
//         return MaterialPageRoute(builder: (_) => QuizEnd());
//       case ('/email'):
//         return MaterialPageRoute(builder: (_) => EmailScreen());
//       case ('/support'):
//         return MaterialPageRoute(builder: (_) => SupportScreen());
//       case ('/premiumSub'):
//         return MaterialPageRoute(builder: (_) => premiumScreen());
//       case ('/UserLanguage'):
//         return MaterialPageRoute(builder: (_) => UserLanguage());
//         default:
//         return MaterialPageRoute(builder: (_) => ErrorBoundary());
//     }
//   }
// }
