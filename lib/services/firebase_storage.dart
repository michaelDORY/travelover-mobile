import 'package:firebase_storage/firebase_storage.dart';

class FStorage {
  final FirebaseStorage _store = FirebaseStorage.instance;

  Future<String> getFile(String fileName) async {
    return await _store.ref(fileName).getDownloadURL();
  }
}
