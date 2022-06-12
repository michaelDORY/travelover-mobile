import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/models/nav_buttons_data.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:travelover_mobile/utils/toast.dart';
import 'package:unicons/unicons.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const MenuScreen()),
    );
  }

  void _logOut(BuildContext context) async {
    context.loaderOverlay.show();
    AuthBase? auth = Provider.of<AuthBase>(context, listen: false);
    try {
      await auth.logOut();
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } catch (e) {
      CustomToast().show();
    } finally {
      context.loaderOverlay.hide();
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
        title: const Text(
          'My profile',
          style: TextStyle(
            color: Colors.yellowAccent,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/mario.jpg'),
              ),
              Form(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      autocorrect: false,
                      decoration: const InputDecoration(
                        icon: Icon(UniconsLine.edit_alt),
                        border: OutlineInputBorder(),
                        hintText: "Name",
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ...NavButtonsData()
                        .userButtons
                        .map((item) => Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: item))
                        .toList(),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              OutlinedButton(
                  onPressed: () => _logOut(context),
                  child: const Text('LogOut'))
            ],
          )),
    );
  }
}
