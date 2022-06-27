import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/firebase_options.dart';
import 'package:travelover_mobile/l10n/l10n.dart';
import 'package:travelover_mobile/screens/Premium_sub.dart';
import 'package:travelover_mobile/screens/main_screen.dart';
import 'package:travelover_mobile/screens/my_profile_screen.dart';
import 'package:travelover_mobile/screens/sign_in_screen.dart';
import 'package:travelover_mobile/screens/sign_up_screen.dart';
import 'package:travelover_mobile/screens/quizes_screen.dart';
import 'package:travelover_mobile/screens/favourite_screen.dart';
import 'package:travelover_mobile/screens/user_language.dart';
import 'package:travelover_mobile/screens/email_screen.dart';
import 'package:travelover_mobile/screens/support_screen.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:travelover_mobile/widgets/root.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:travelover_mobile/provider/locale_provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthBase>(
          create: (context) => AuthService(),
        ),
        ChangeNotifierProvider<LocaleProvider>(
            create: (context) => LocaleProvider(),
            builder: (context, child) {
              final provider = Provider.of<LocaleProvider>(context);
              return GlobalLoaderOverlay(
                useDefaultLoading: false,
                overlayWidget: const Center(
                  child: SpinKitThreeInOut(
                    color: Colors.yellowAccent,
                    size: 50.0,
                  ),
                ),
                child: MaterialApp(
                    title: "TraveLover",
                    supportedLocales: L10n.all,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                    ],
                    locale: provider.locale,
                    initialRoute: '/',
                    routes: {
                      '/main': (context) => const MainScreen(),
                      '/signIn': (context) => const SignInScreen(),
                      '/signUp': (context) => const SignUpScreen(),
                      '/': (context) => const Root(),
                      '/user': (context) => const MyProfile(),
                      '/quizes': (context) => const QuizesScreen(),
                      '/email': (context) => const EmailScreen(),
                      '/support': (context) => const SupportScreen(),
                      '/premiumSub': (context) => const PremiumScreen(),
                      '/UserLanguage': (context) => const UserLanguage(),
                      '/favourite': (context) => const FavoutiteScreen(),
                    },
                    theme: CustomTheme(context)),
              );
            }),
      ],
    );
  }

  ThemeData CustomTheme(BuildContext context) => ThemeData(
      primaryColor: Colors.yellowAccent,
      primarySwatch: Colors.yellow,
      fontFamily: CyrillicFonts.montserrat().fontFamily,
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 25.0,
            color: Colors.yellowAccent,
            fontWeight: FontWeight.w700),
        headline2: TextStyle(
            fontSize: 20.0,
            color: Colors.yellowAccent,
            fontWeight: FontWeight.w700),
        headline3: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
        bodyText1: TextStyle(
          fontSize: 18.0,
        ),
        button: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
        subtitle1: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
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
