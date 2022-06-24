import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:unicons/unicons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuizEnd extends StatefulWidget {
  final double result;
  const QuizEnd({Key? key, required this.result}) : super(key: key);

  @override
  State<QuizEnd> createState() => _QuizEndState();
}

class _QuizEndState extends State<QuizEnd> {
  Widget _buildResultContainer(List<Widget> children) {
    return Column(children: children);
  }

  Widget _buildResultInfo(double result) {
    List<Widget> children = [];

    if (result < 20.0) {
      children = [
        Text(AppLocalizations.of(context).dontBeUpset,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.yellow,
              fontWeight: FontWeight.w800,
            )),
        const SizedBox(
          height: 15.0,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/low_mark.jpg',
            height: 175,
            width: 275,
            fit: BoxFit.cover,
          ),
        )
      ];
    } else if (result >= 20.0 && result < 60.0) {
      children = [
        Text(AppLocalizations.of(context).rightWay,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.yellow,
              fontWeight: FontWeight.w800,
            )),
        const SizedBox(
          height: 15.0,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/middle_mark1.jpg',
            height: 175,
            width: 275,
            fit: BoxFit.cover,
          ),
        )
      ];
    } else if (result >= 60.0 && result < 90) {
      children = [
        Text(AppLocalizations.of(context).goodGob,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.yellow,
              fontWeight: FontWeight.w800,
            )),
        const SizedBox(
          height: 15.0,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/middle_mark2.jpg',
            height: 175,
            width: 275,
            fit: BoxFit.cover,
          ),
        )
      ];
    } else {
      children = [
        Text(AppLocalizations.of(context).weelDone,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.yellow,
              fontWeight: FontWeight.w800,
            )),
        const SizedBox(
          height: 15.0,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/high_mark.jpg',
            height: 175,
            width: 275,
            fit: BoxFit.cover,
          ),
        )
      ];
    }

    return _buildResultContainer(children);
  }

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
          title: Text(AppLocalizations.of(context).res),
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 15.0,
            ),
            child: Column(children: [
              const SizedBox(
                height: 30.0,
              ),
              Text(
                  "${AppLocalizations.of(context).scored} ${widget.result}%", // !!!!!!!!!!!!!!!!!!!!!!!!
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.yellow,
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(
                height: 40.0,
              ),
              _buildResultInfo(widget.result),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15.0,
                ),
                child: Column(children: [
                  const SizedBox(
                    height: 65.0,
                  ),
                  Text(AppLocalizations.of(context).share,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.yellow,
                      )),
                  const SizedBox(
                    height: 30.0,
                  ),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () async {
                      Share.share(
                          "${AppLocalizations.of(context).shapeLink1} ${widget.result}% ${AppLocalizations.of(context).shapeLink2}");
                    },
                    icon: const Icon(
                      UniconsLine.share,
                      size: 30.0,
                    ),
                    label: Text(AppLocalizations.of(context).shareButton),
                  ),
                ]),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(AppLocalizations.of(context).home)),
              )
            ])));
  }
}
