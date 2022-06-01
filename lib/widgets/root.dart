import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/screens/main_screen.dart';
import 'package:travelover_mobile/screens/sign_in_screen.dart';
import 'package:travelover_mobile/services/auth.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthBase? auth = Provider.of<AuthBase>(context, listen: false);

    return StreamBuilder<User?>(
      stream: auth.onAuthStateChanged(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;
          print("User $user");
          if (user == null) {
            return const SignInScreen();
          } else {
            return const MainScreen();
          }
        } else {
          return Scaffold(
              body: Container(
                  color: Colors.black,
                  child: const Center(
                    child:
                        CircularProgressIndicator(color: Colors.yellowAccent),
                  )));
        }
      },
    );
  }
}
