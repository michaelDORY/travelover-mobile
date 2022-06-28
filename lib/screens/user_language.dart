import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/l10n/l10n.dart';
import 'package:travelover_mobile/provider/locale_provider.dart';
import 'package:unicons/unicons.dart';
import '../widgets/nav_button.dart';
import 'menu_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserLanguage extends StatefulWidget {
  const UserLanguage({Key? key}) : super(key: key);

  @override
  State<UserLanguage> createState() => _UserLanguageState();
}

void _menuOpen(context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => MenuScreen()),
  );
}

class _UserLanguageState extends State<UserLanguage> {
  late Locale selectedValue;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context, listen: false);
    final locale = provider.locale ?? Locale('en');
    setState(() {
      selectedValue = locale;
    });

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => _menuOpen(context),
                icon: const Icon(UniconsLine.bars))
          ],
          title: Text(AppLocalizations.of(context).language),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: Column(
              children: [
                Text(AppLocalizations.of(context).chooseTheLan,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.yellow,
                      fontWeight: FontWeight.w800,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                          width: 600.0,
                          height: 400.0,
                          child: ListView(children: [
                            ...L10n.all.map((locale) {
                              final language =
                                  L10n.getLanguage(locale.languageCode);
                              return _buildRadioButton(
                                  title: language, value: locale);
                            })
                          ])),
                    ],
                  ),
                )
              ],
            )));
  }

  Widget _buildRadioButton({required String title, required Locale value}) {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 7.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        ),
        child: RadioListTile<Locale>(
            value: value,
            groupValue: selectedValue,
            activeColor: Colors.yellow,
            title: Text(title),
            onChanged: (value) {
              final provider =
                  Provider.of<LocaleProvider>(context, listen: false);

              provider.setLocale(value!);
              setState(() => selectedValue = value);
            }));
  }
}
