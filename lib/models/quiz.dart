import 'package:cloud_firestore/cloud_firestore.dart';

class Quiz {
  final String _quizId;
  final String _description;
  final String _nameOfQuiz;
  final String _image;
  final String _section;
  final String _time;

  Quiz.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json)
      : _quizId = json.id,
        _description = json['description'],
        _nameOfQuiz = json['nameOfQuiz'],
        _image = json['image'],
        _section = json['section'],
        _time = json['time'];

  String get quizId => _quizId;
  String get description => _description;
  String get nameOfQuiz => _nameOfQuiz;
  String get image => _image;
  String get section => _section;
  String get time => _time;
}
