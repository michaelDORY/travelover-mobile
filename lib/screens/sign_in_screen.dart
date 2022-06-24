import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:travelover_mobile/utils/toast.dart';
import 'package:travelover_mobile/widgets/nav_button.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
  ]);

  final emailValidator = MultiValidator([
    RequiredValidator(errorText: 'Email is required'),
    EmailValidator(errorText: 'Enter correct email')
  ]);

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void _signInWithEmailAndPassword(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    context.loaderOverlay.show();
    AuthBase? auth = Provider.of<AuthBase>(context, listen: false);
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      context.loaderOverlay.hide();
      Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
    } catch (e) {
      CustomToast(message: "No such user").show();
    } finally {
      //context.loaderOverlay.hide();
    }
  }

  void _signInWithGoogle(BuildContext context) async {
    context.loaderOverlay.show();
    AuthBase? auth = Provider.of<AuthBase>(context, listen: false);
    try {
      await auth.signInWithGoogle();
      Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
    } catch (e) {
      CustomToast(message: "Something went wrong").show();
    } finally {
      context.loaderOverlay.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: emailValidator,
      onSaved: (value) {
        emailController.text = value!;
      },
      decoration: InputDecoration(
        icon: Icon(UniconsLine.envelope_alt),
        border: OutlineInputBorder(),
        hintText: AppLocalizations.of(context).email,
      ),
    );

    final passwordField = TextFormField(
      controller: passwordController,
      autocorrect: false,
      autovalidateMode: AutovalidateMode.disabled,
      textInputAction: TextInputAction.done,
      obscureText: true,
      validator: passwordValidator,
      onSaved: (value) {
        passwordController.text = value!;
      },
      decoration: InputDecoration(
        icon: Icon(UniconsLine.key_skeleton_alt),
        border: OutlineInputBorder(),
        hintText: AppLocalizations.of(context).password,
      ),
    );

    final signInButton = ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () => _signInWithEmailAndPassword(context),
        child: Text(AppLocalizations.of(context).login));

    final signUpLink = OutlinedButton(
        style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            side: BorderSide(color: Theme.of(context).primaryColor)),
        onPressed: () {
          Navigator.pushNamed(context, '/signUp');
        },
        child: Text(AppLocalizations.of(context).signUp));

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(top: 40, bottom: 30, left: 30, right: 30),
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
                    NavButton(
                      icon: UniconsLine.google,
                      title: AppLocalizations.of(context).authorize,
                      subTitle: AppLocalizations.of(context).loginViaGoogle,
                      action: () => _signInWithGoogle(context),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      AppLocalizations.of(context).or,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 18.0),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            emailField,
                            const SizedBox(
                              height: 10.0,
                            ),
                            passwordField,
                            const SizedBox(
                              height: 20.0,
                            ),
                            signInButton,
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
              signUpLink,
            ],
          ),
        ),
      ),
    );
  }
}
