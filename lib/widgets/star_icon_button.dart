import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class StarIconButton extends StatelessWidget {
  final bool isFilled;
  final VoidCallback onPressed;
  const StarIconButton(
      {Key? key,
      required this.isFilled,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          isFilled ? EvaIcons.star : EvaIcons.starOutline,
          color: Colors.yellow,
          size: 40,
        ),
        onPressed: onPressed);
  }
}
