import "package:flutter/material.dart";
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:travelover_mobile/pages/main_screen.dart';
import 'package:travelover_mobile/pages/my_profile.dart';
import 'package:travelover_mobile/pages/sign_in_screen.dart';
import 'package:travelover_mobile/pages/sign_up_screen.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "TraveLover",
        initialRoute: '/signIn',
        routes: {
          '/signIn': (context) => const SignInScreen(),
          '/signUp': (context) => const SignUpScreen(),
          '/': (context) => const MainSCreen(),
          '/user': (context) => const MyProfile(),
        },
        theme: ThemeData(
            primaryColor: Colors.yellowAccent,
            primarySwatch: Colors.yellow,
            fontFamily: CyrillicFonts.montserrat().fontFamily,
            textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700),
              headline2: TextStyle(
                  fontSize: 18.0,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700),
              headline3:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
              bodyText1: const TextStyle(
                fontSize: 16.0,
              ),
              button:
                  const TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
              subtitle1:
                  const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
            ),
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.black,
                centerTitle: true,
                actionsIconTheme: IconThemeData(color: Colors.yellowAccent),
                titleTextStyle: TextStyle(
                    fontSize: 18.0,
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
                    side: BorderSide(color: Colors.yellowAccent),
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
            )));
  }
}
