import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:travelover_mobile/widgets/nav_button.dart';
import 'package:unicons/unicons.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void _signInWithEmailAndPassword(BuildContext context) async {
    try {
      await AuthService().signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Wrong password or email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Color.fromARGB(255, 255, 130, 121),
          textColor: Color.fromARGB(255, 0, 0, 0),
          fontSize: 16.0);
    }
  }

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
                        icon: UniconsLine.google,
                        title: 'Авторизироваться',
                        subTitle: 'Войти через Google',
                        path: '/googleAuth'),
                    const SizedBox(
                      height: 10.0,
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
                          controller: emailController,
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
                          controller: passwordController,
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
                            onPressed: () => _signInWithEmailAndPassword(context),
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
