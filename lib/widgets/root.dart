import 'package:flutter/material.dart';
import 'package:travelover_mobile/pages/main_screen.dart';
import 'package:travelover_mobile/pages/sign_in_screen.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  final bool _isUserLogged = false;

  @override
  Widget build(BuildContext context) {
    return _isUserLogged ? const MainScreen() : const SignInScreen();
  }
}
