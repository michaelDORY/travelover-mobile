import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/firebase_options.dart';
import 'package:travelover_mobile/screens/Premium_sub.dart';
import 'package:travelover_mobile/screens/main_screen.dart';
import 'package:travelover_mobile/screens/my_profile_screen.dart';
import 'package:travelover_mobile/screens/sign_in_screen.dart';
import 'package:travelover_mobile/screens/sign_up_screen.dart';
import 'package:travelover_mobile/screens/quizes_screen.dart';
import 'package:travelover_mobile/screens/quizDescription_screen.dart';
import 'package:travelover_mobile/screens/quizEnd_screen.dart';
import 'package:travelover_mobile/screens/quizQuestion_screen.dart';
import 'package:travelover_mobile/screens/user_language.dart';
import 'package:travelover_mobile/screens/email_screen.dart';
import 'package:travelover_mobile/screens/support_screen.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:travelover_mobile/widgets/root.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => AuthService(),
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: const Center(
          child: SpinKitThreeInOut(
            color: Colors.yellowAccent,
            size: 50.0,
          ),
        ),
        child: MaterialApp(
            title: "TraveLover",
            initialRoute: '/',
            routes: {
              '/main': (context) => const MainScreen(),
              '/signIn': (context) => const SignInScreen(),
              '/signUp': (context) => const SignUpScreen(),
              '/': (context) => const Root(),
              '/user': (context) => const MyProfile(),
              '/quizes': (context) => const QuizesScreen(),
              '/quizDesc': (context) => const QuizDescription(),
              '/quizEnd': (context) => const QuizEnd(),
              '/quizQuestion': (context) => const quizQuestionScreen(),
              '/email': (context) => const EmailScreen(),
              '/support': (context) => const SupportScreen(),
              '/premiumSub': (context) => const PremiumScreen(),
              '/UserLanguage': (context) => const UserLanguage(),
            },
            theme: CustomTheme(context)),
      ),
    );
  }

  ThemeData CustomTheme(BuildContext context) => ThemeData(
      primaryColor: Colors.yellowAccent,
      primarySwatch: Colors.yellow,
      fontFamily: CyrillicFonts.montserrat().fontFamily,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 30.0,
            color: Colors.yellowAccent,
            fontWeight: FontWeight.w700),
        headline2: TextStyle(
            fontSize: 25.0,
            color: Colors.yellowAccent,
            fontWeight: FontWeight.w700),
        headline3: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        bodyText1: const TextStyle(
          fontSize: 18.0,
        ),
        button: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
        subtitle1: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.yellowAccent, size: 32),
          titleTextStyle: TextStyle(
              fontSize: 24.0,
              color: Colors.yellowAccent,
              fontWeight: FontWeight.w700)),
      backgroundColor: Colors.black,
      brightness: Brightness.dark,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: CyrillicFonts.montserrat().fontFamily))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.yellowAccent),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: CyrillicFonts.montserrat().fontFamily))),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.yellow),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.yellowAccent),
        ),
      ));
}
