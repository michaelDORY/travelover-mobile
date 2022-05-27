import 'package:flutter/material.dart';
import 'package:travelover_mobile/services/auth.dart';

class Provider extends InheritedWidget {
  final AuthService auth;
  const Provider({
    Key? key,
    required Widget child,
    required this.auth,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWiddget) {
    return true;
  }

  static Provider? of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>());
}