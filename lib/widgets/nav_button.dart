import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class NavButton extends StatelessWidget {
  final icon;
  final title;
  final subTitle;
  final path;

  const NavButton(
      {Key? key,
      @required this.icon,
      @required this.title,
      @required this.subTitle,
      @required this.path})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subTitle, style: Theme.of(context).textTheme.subtitle1),
                  Text(title, style: Theme.of(context).textTheme.headline3),
                ],
              ),
              const Icon(UniconsLine.angle_right)
            ],
          ),
        ));
  }
}
