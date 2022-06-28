import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FStorage {
  final FirebaseStorage _store = FirebaseStorage.instance;

  Future<String> getFile(String fileName) async {
    return await _store.ref(fileName).getDownloadURL();
  }

  Future<String?> putFile(String fileName, File file) async {
    await _store.ref().child(fileName).putFile(file);
    return await _store.ref(fileName).getDownloadURL();
  }
}
