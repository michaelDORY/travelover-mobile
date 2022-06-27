import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MenuScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => _menuOpen(context),
                icon: const Icon(UniconsLine.bars))
          ],
          title: Text(AppLocalizations.of(context).email),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: Column(children: [
              const SizedBox(
                height: 15.0,
              ),
              Text(AppLocalizations.of(context).currentEmail,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.yellow,
                  )),
              const SizedBox(
                height: 30.0,
              ),
              const TextField(
                  decoration: InputDecoration(
                hintText: "example@gmail.com",
                icon: Icon(UniconsLine.edit_alt),
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              )),
              const SizedBox(
                height: 300.0,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/user');
                  },
                  child: Text(AppLocalizations.of(context).confirm)),
            ])));
  }
}
