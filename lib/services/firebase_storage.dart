import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseStore {
  // final _emulatorHost =
  //     (!kIsWeb && defaultTargetPlatform == TargetPlatform.android)
  //         ? '10.0.2.2'
  //         : 'localhost';
  // final _emulatorPort = 9199;
  final FirebaseStorage _store = FirebaseStorage.instance;

  // Future<void> useStorageEmulator() async {
  //   await _store.useStorageEmulator(_emulatorHost, _emulatorPort);
  // }

  Future<String> getFile(String fileName) async {
    return await _store.ref(fileName).getDownloadURL();
  }
}
