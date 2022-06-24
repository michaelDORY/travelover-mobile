import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  String path;
  var action;

  NavButton(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.path = '',
      this.action})
      : super(key: key);

  void _onAction(BuildContext context, String path) {
    if (path != '') {
      Navigator.pushNamed(context, path);
    } else if (action != null) {
      action();
    }
  }

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () => _onAction(context, path),
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
