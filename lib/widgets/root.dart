import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multiple_stream_builder/multiple_stream_builder.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/models/user.dart';
import 'package:travelover_mobile/screens/main_screen.dart';
import 'package:travelover_mobile/screens/sign_in_screen.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:travelover_mobile/services/firestore.dart';
import 'package:travelover_mobile/widgets/error_boundary.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    AuthBase? auth = Provider.of<AuthBase>(context, listen: false);

    return StreamBuilder<User?>(
      stream: auth.onAuthStateChanged(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data == null) {
            return const SignInScreen();
          } else {
            return MainScreen();
          }
        } else {
          return _buildLoader();
        }
      },
    );
  }

  Widget _buildLoader() {
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.yellowAccent),
            )));
  }
}
