import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/models/nav_buttons_data.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:travelover_mobile/utils/toast.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';

class MyProfile extends StatefulWidget {
  final String name;
  const MyProfile({Key? key, required this.name}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool circular = false;
  final ImagePicker _picker = ImagePicker();
  PickedFile? _imageFile;

  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MenuScreen()),
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
        title: Text(
          AppLocalizations.of(context).myProfile,
          style: const TextStyle(
            color: Colors.yellowAccent,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              imageProfile(),
              // const CircleAvatar(
              //   radius: 80,
              //   backgroundImage: AssetImage('assets/images/mario.jpg'),
              // ),
              Form(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(widget.name),
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
                child: Text(AppLocalizations.of(context).logOut),
              )
            ],
          )),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          // ignore: unnecessary_null_comparison
          backgroundImage: _imageFile == null
              ? null // added this line
              : FileImage(File(_imageFile!.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              color: Colors.yellowAccent,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  void takePhoto(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile!;
    });
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            // ignore: deprecated_member_use
            // ignore: deprecated_member_use
            FlatButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: const Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
}
