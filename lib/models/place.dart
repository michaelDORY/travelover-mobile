import 'package:travelover_mobile/services/firebase_storage.dart';

class Place {
  final String _title;
  final String _country;
  final String _address;
  final String _description;
  final String _imagePath;
  late String _imageUrl;
  final int _views;
  final String _errorImageUrl =
      "https://images.unsplash.com/photo-1555861496-0666c8981751?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";

  Place.fromJson(json)
      : _title = json['title'],
        _country = json['country'],
        _address = json['address'],
        _description = json['description'],
        _imagePath = json['image'],
        _views = json['views'] {
    _getImageUrl();
  }

  void _getImageUrl() {
    FirebaseStore().getFile(_imagePath).then((value) {
      _imageUrl = value;
    }).catchError(() {
      _imageUrl = _errorImageUrl;
    });
  }

  String get title => _title;
  String get country => _country;
  String get address => _address;
  String get description => _description;
  String get imageUrl => _imageUrl;
  int get views => _views;
}
