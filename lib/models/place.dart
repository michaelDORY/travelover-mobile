import 'package:cloud_firestore/cloud_firestore.dart';

class Place {
  final String _placeId;
  final String _title;
  final String _country;
  final String _address;
  final String _description;
  final String _imagePath;
  final int _views;

  Place.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json)
      : _placeId = json.id,
        _title = json['title'],
        _country = json['country'],
        _address = json['address'],
        _description = json['description'],
        _imagePath = json['image'],
        _views = json['views'];

  String get placeId => _placeId;
  String get title => _title;
  String get country => _country;
  String get address => _address;
  String get description => _description;
  String get imagePath => _imagePath;
  int get views => _views;
}
