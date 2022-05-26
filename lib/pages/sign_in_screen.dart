import 'package:flutter/material.dart';
import 'package:travelover_mobile/pages/main_screen.dart';
import 'package:travelover_mobile/widgets/nav_button.dart';
import 'package:unicons/unicons.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        padding:
            const EdgeInsets.only(top: 40, bottom: 70, left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints.loose(Size.infinite),
                        margin: const EdgeInsets.only(bottom: 15),
                        child: Image.asset(
                          'assets/images/planet.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const NavButton(
                      icon: Icon(UniconsLine.google),
                      title: 'Авторизироваться',
                      subTitle: 'Войти через Google',
                    ),
                    const Text(
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
                            icon: Icon(UniconsLine.envelope_alt),
                            border: OutlineInputBorder(),
                            hintText: "Email",
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          autocorrect: false,
                          decoration: const InputDecoration(
                            icon: Icon(UniconsLine.key_skeleton_alt),
                            border: OutlineInputBorder(),
                            hintText: "Пароль",
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                            ),
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                            },
                            child: const Text("Войти")),
                      ],
                    ))
                  ]),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Divider(
              height: 3.0,
              indent: 50.0,
              endIndent: 50.0,
              color: Colors.white,
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        side:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                    child: const Text("Зарегистрироваться")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
