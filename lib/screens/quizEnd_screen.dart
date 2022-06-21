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
  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const MenuScreen()),
    );
  }

  textIn() {
    if (widget.result < 20) {
      const Text("Don't be upset!Try again",
          style: TextStyle(
            fontSize: 25,
            color: Colors.yellow,
            fontWeight: FontWeight.w800,
          ));
    } else if (20 < widget.result && widget.result < 70) {
      const Text("You are on the right way!",
          style: TextStyle(
            fontSize: 25,
            color: Colors.yellow,
            fontWeight: FontWeight.w800,
          ));
    } else if (widget.result > 70 && widget.result < 90) {
      const Text("Good job!",
          style: TextStyle(
            fontSize: 25,
            color: Colors.yellow,
            fontWeight: FontWeight.w800,
          ));
    } else if (widget.result > 90) {
      const Text("Well done!Perfect job!",
          style: TextStyle(
            fontSize: 25,
            color: Colors.yellow,
            fontWeight: FontWeight.w800,
          ));
    }
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
                height: 50.0,
              ),
              Text("You have scored ${widget.result}%",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.yellow,
                    fontWeight: FontWeight.w800,
                  )),
              const SizedBox(
                height: 70.0,
              ),
              (widget.result < 20.0)
                  ? const Text("Don't be upset!Try again",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.yellow,
                        fontWeight: FontWeight.w800,
                      ))
                  : (20.0 < widget.result && widget.result < 70.0)
                      ? const Text("You are on the right way!",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.yellow,
                            fontWeight: FontWeight.w800,
                          ))
                      : (widget.result > 70.0 && widget.result < 90.0)
                          ? const Text("Good job!",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.yellow,
                                fontWeight: FontWeight.w800,
                              ))
                          : (widget.result > 90.0)
                              ? const Text("Well done!Perfect job!")
                              : const Text("Oops",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.w800,
                                  )),
              const SizedBox(
                height: 70.0,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 15.0,
                ),
                child: Column(children: [
                  const SizedBox(
                    height: 120.0,
                  ),
                  const Text("SHARE YOUR RESULTS",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 50.0,
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
