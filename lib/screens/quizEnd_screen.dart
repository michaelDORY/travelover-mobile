import 'package:flutter/material.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:unicons/unicons.dart';
import 'package:share_plus/share_plus.dart';

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
        const Text("Don't be upset! Try again",
            style: TextStyle(
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
        const Text("You are on the right way!",
            style: TextStyle(
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
        const Text("Good job!",
            style: TextStyle(
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
        const Text("Well done! Perfect job!",
            style: TextStyle(
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
          title: const Text('Result'),
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
              Text("You have scored ${widget.result}%",
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
                  const Text("SHARE YOUR RESULTS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
                          'Look what I got in this test!I scored ${widget.result} out of 100!\nI completed this quiz on the incredible Travelover app! Download this app to test your knowledge!');
                    },
                    icon: const Icon(
                      UniconsLine.share,
                      size: 30.0,
                    ),
                    label: const Text('Share'),
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
                    child: const Text("Home")),
              )
            ])));
  }
}
