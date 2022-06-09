class FirestoreUser {
  final String _email;
  final bool _hasPro;
  final String _id;
  final List<dynamic> _favourites;

  FirestoreUser.fromJson(json)
      : _email = json['email'],
        _hasPro = json['hasPro'],
        _id = json['_id'],
        _favourites = json['favourites'];

  String get email => _email;
  bool get hasPro => _hasPro;
  String get id => _id;
  List<dynamic> get favourites => _favourites;
}
