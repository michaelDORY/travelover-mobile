import "package:flutter/material.dart";
import 'package:unicons/unicons.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "TraveLover",
        home: const Scaffold(
          body: const Auth(),
        ),
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.yellowAccent,
            primarySwatch: Colors.yellow,
            fontFamily: 'Montserrat',
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.yellow),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.yellowAccent),
              ),
            )));
  }
}

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 40, bottom: 70, left: 30, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Expanded(
              flex: 5,
              child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/planet.png'),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(UniconsLine.google),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Авторизироваться'),
                                    Text('Войти через Google'),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          )),
                      Text(
                        "или",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18.0),
                      ),
                      Form(
                          child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(),
                              hintText: "Email",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              autocorrect: false,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.key_outlined),
                                border: OutlineInputBorder(),
                                hintText: "Password",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50),
                                ),
                                onPressed: () {},
                                child: const Text("Войти")),
                          )
                        ],
                      ))
                    ]),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  onPressed: () {},
                  child: const Text("Зарегистрироваться")),
            ),
          ),
        ],
      ),
    );
  }
}
