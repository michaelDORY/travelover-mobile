import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ErrorBoundary extends StatelessWidget {
  const ErrorBoundary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          height: 250.0,
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Sorry, something went wrong'),
                Image.asset('assets/images/error.jpg',
                    height: 150.0, fit: BoxFit.cover)
              ])),
    );
  }
}
