import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:travelover_mobile/utils/toast.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
  }

  void _signUpWithEmailAndPassword(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    context.loaderOverlay.show();
    AuthBase? auth = Provider.of<AuthBase>(context, listen: false);
    try {
      await auth.signUpWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text);
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
    } catch (e) {
      CustomToast(message: "Enter correct fields").show();
    } finally {
      context.loaderOverlay.hide();
    }
  }

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
  ]);

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Enter correct email')
  ]);

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      autocorrect: false,
      controller: nameController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      validator: RequiredValidator(errorText: 'Name is required'),
      onSaved: (value) {
        nameController.text = value!;
      },
      decoration: InputDecoration(
        icon: Icon(UniconsLine.user),
        border: OutlineInputBorder(),
        hintText: AppLocalizations.of(context).name,
      ),
    );

    final emailField = TextFormField(
      controller: emailController,
      validator: emailValidator,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        icon: const Icon(UniconsLine.envelope_alt),
        border: const OutlineInputBorder(),
        hintText: AppLocalizations.of(context).email,
      ),
    );

    final passwordField = TextFormField(
      controller: passwordController,
      autovalidateMode: AutovalidateMode.disabled,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      obscureText: true,
      validator: passwordValidator,
      onSaved: (value) {
        passwordController.text = value!;
      },
      decoration: InputDecoration(
        icon: const Icon(UniconsLine.key_skeleton_alt),
        border: const OutlineInputBorder(),
        hintText: AppLocalizations.of(context).password,
      ),
    );

    final signUpButton = ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () => _signUpWithEmailAndPassword(context),
        child: Text(AppLocalizations.of(context).signUp));

    final signInLink = OutlinedButton(
        style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            side: BorderSide(color: Theme.of(context).primaryColor)),
        onPressed: () {
          Navigator.pushNamed(context, '/signIn');
        },
        child: Text(AppLocalizations.of(context).login));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 40, bottom: 20, left: 30, right: 30),
          reverse: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      constraints:
                          BoxConstraints(maxHeight: 160, minHeight: 80),
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Image.asset(
                        'assets/images/planet.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            nameField,
                            const SizedBox(
                              height: 10.0,
                            ),
                            emailField,
                            const SizedBox(
                              height: 10.0,
                            ),
                            passwordField,
                            const SizedBox(
                              height: 20.0,
                            ),
                            signUpButton,
                          ],
                        ))
                  ]),
              const SizedBox(
                height: 20.0,
              ),
              const Divider(
                height: 3.0,
                indent: 50.0,
                endIndent: 50.0,
                color: Colors.white,
              ),
              const SizedBox(
                height: 20.0,
              ),
              signInLink,
            ],
          ),
        ),
      ),
    );
  }
}
