import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:travelover_mobile/screens/menu_screen.dart';
import 'package:travelover_mobile/models/nav_buttons_data.dart';
import 'package:travelover_mobile/services/auth.dart';
import 'package:travelover_mobile/services/firebase_storage.dart';
import 'package:travelover_mobile/utils/toast.dart';
import 'package:travelover_mobile/widgets/nav_button.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool circular = false;
  final ImagePicker _picker = ImagePicker();
  String? _imageFileUrl;
  String username = "User";
  final TextEditingController _textFieldController = TextEditingController();
  late AuthBase Auth;

  @override
  void initState() {
    super.initState();
  }

  void _menuOpen(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MenuScreen()),
    );
  }

  void _logOut() async {
    context.loaderOverlay.show();
    try {
      await Auth.logOut();
      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } catch (e) {
      CustomToast().show();
    } finally {
      context.loaderOverlay.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthBase auth = Provider.of<AuthBase>(context);
    setState(() {
      Auth = auth;
    });

    if (auth.currentUser!.photoURL != null) {
      setState(() {
        _imageFileUrl = auth.currentUser!.photoURL;
      });
    }
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
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
              Form(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 0.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(Auth.currentUser!.displayName ?? "User",
                              style: Theme.of(context).textTheme.headline2),
                          const SizedBox(
                            width: 10.0,
                          ),
                          InkWell(
                            onTap: () {
                              _showPopup(Auth);
                            },
                            child: const Icon(
                              UniconsLine.pen,
                              color: Colors.yellowAccent,
                              size: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.yellowAccent,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ..._buildNavButtons(context).map((item) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: item)),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              OutlinedButton(
                onPressed: () => _logOut(),
                child: Text(AppLocalizations.of(context).logOut),
              )
            ],
          )),
    );
  }

  Future _showPopup(AuthBase Auth) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Text(AppLocalizations.of(context).changeYourName),
            content: TextField(
              onChanged: (value) {
                username = value;
              },
              controller: _textFieldController,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).hintVasya),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text(AppLocalizations.of(context).add),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30)),
                onPressed: () {
                  if (username != '') {
                    Auth.updateUserName(username).then((value) {
                      if (value != null && value != '') {
                        setState(() {
                          username = value;
                        });
                        CustomToast(
                                color: Colors.green,
                                message:
                                    AppLocalizations.of(context).sucessChanged)
                            .show();
                      }
                    });
                  }
                  _textFieldController.clear();

                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  List<NavButton> _buildNavButtons(BuildContext context) {
    return [
      NavButton(
          icon: UniconsLine.language,
          title: AppLocalizations.of(context).language,
          subTitle: AppLocalizations.of(context).chooseLan,
          path: '/UserLanguage'),
      NavButton(
          icon: UniconsLine.envelope,
          title: AppLocalizations.of(context).email,
          subTitle: AppLocalizations.of(context).currentEmail,
          path: '/email'),
      NavButton(
          icon: UniconsLine.comments,
          title: AppLocalizations.of(context).support,
          subTitle: AppLocalizations.of(context).needHelp,
          path: '/support')
    ];
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
            radius: 80.0,
            backgroundImage: _imageFileUrl != null
                ? NetworkImage(_imageFileUrl!)
                : NetworkImage(
                    'https://images.unsplash.com/photo-1533738363-b7f9aef128ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80')),
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
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      String? res =
          await FStorage().putFile(Uuid().v4(), File(pickedFile!.path));
      await Auth.currentUser!.updatePhotoURL(res);
      if (res != null) {
        setState(() {
          _imageFileUrl = res;
        });
      }
    }
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
