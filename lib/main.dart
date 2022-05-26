import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:travelover_mobile/pages/main_screen.dart';
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
        },
        theme: ThemeData(
            primaryColor: Colors.yellowAccent,
            primarySwatch: Colors.yellow,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700),
              headline3: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
              bodyText1: const TextStyle(
                fontSize: 16.0,
              ),
              button: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
              subtitle1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
            ),
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.black,
                centerTitle: true,
                titleTextStyle: Theme.of(context).textTheme.headline2),
            backgroundColor: Colors.black,
            brightness: Brightness.dark,
            // elevatedButtonTheme: ElevatedButtonThemeData(
            //     style: ButtonStyle(
            //         textStyle: MaterialStateProperty.all<TextStyle?>(
            //             const TextStyle(fontWeight: FontWeight.w700)))),
            // outlinedButtonTheme: OutlinedButtonThemeData(
            //     style: ButtonStyle(
            //         textStyle: MaterialStateProperty.all<TextStyle?>(
            //             const TextStyle(fontWeight: FontWeight.w700)))),
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
