import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class NavButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final String path;

  const NavButton(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subTitle,
      required this.path})
      : super(key: key);

  void _navigateTo(BuildContext context, String path) {
    Navigator.pushNamed(context, path);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () => _navigateTo(context, path),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, size: 30.0),
                  const SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(subTitle,
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.fontSize)),
                      Text(title,
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.fontSize)),
                    ],
                  ),
                ],
              ),
              const Icon(UniconsLine.angle_right)
            ],
          ),
        ));
  }
}
