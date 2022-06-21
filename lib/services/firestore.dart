import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travelover_mobile/models/place.dart';
import 'package:travelover_mobile/models/quiz.dart';
import 'package:travelover_mobile/models/user.dart';
import 'package:travelover_mobile/services/auth.dart';

class Firestore {
  final FirebaseFirestore _fStore = FirebaseFirestore.instance;

  Future<void> _addUser(User user) async {
    Timestamp timestamp = Timestamp.fromDate(DateTime.now());

    final newUser = {
      "email": user.email!,
      "_id": user.uid,
      "timeStamp": timestamp,
      "hasPro": false,
      "favourites": []
    };

    _fStore.collection('users').doc(user.uid).set(newUser);
  }

  Future<FirestoreUser?> fetchUser(String id) {
    return _fStore
        .collection('users')
        .where('_id', isEqualTo: id)
        .get()
        .then((snapshot) {
      if (snapshot.docs.isEmpty) {
        _addUser(AuthService().currentUser!);
      } else {
        return FirestoreUser.fromJson(snapshot.docs[0]);
      }
    });
  }

  Future<List<dynamic>> getUserFavourites(String userId) async {
    return _fStore
        .collection('users')
        .doc(userId)
        .get()
        .then((doc) => doc['favourites']);
  }

  Future addPlaceToFavourites(String userId, String placeId) async {
    List<dynamic> newFavourites = await getUserFavourites(userId);
    newFavourites.add(placeId);

    return _fStore
        .collection('users')
        .doc(userId)
        .update({'favourites': newFavourites});
  }

  Future deletePlaceFromFavourites(String userId, String placeId) async {
    List<dynamic> currentFavourites = await getUserFavourites(userId);
    List<dynamic> newFavourites =
        currentFavourites.where((item) => item != placeId).toList();

    return _fStore
        .collection('users')
        .doc(userId)
        .update({'favourites': newFavourites});
  }

  Future<int> getUserRatingForPlace(String userId, String placeId) async {
    try {
      FirestoreUser? user = await fetchUser(userId);
      if (user == null) return 0;
      int indexOfObject =
          user.placesRatings.indexWhere((item) => item['placeId'] == placeId);
      if (indexOfObject == -1) {
        return 0;
      } else {
        return await user.placesRatings[indexOfObject]['rating'];
      }
    } on FirebaseException catch (e) {
      return 0;
    }
  }

  Future<bool> updateUserPlaceRating(
      String userId, String placeId, int newRating) async {
    try {
      FirestoreUser? fUser = await fetchUser(userId);
      if (fUser == null) return false;
      int indexOfPlace =
          fUser.placesRatings.indexWhere((item) => item['placeId'] == placeId);
      if (indexOfPlace == -1) {
        await _fStore.collection('users').doc(userId).update({
          'placesRatings': [
            ...fUser.placesRatings,
            {'placeId': placeId, 'rating': newRating}
          ]
        });
      } else {
        List newRatings = [...fUser.placesRatings];
        newRatings[indexOfPlace] = {
          ...newRatings[indexOfPlace],
          'rating': newRating
        };
        await _fStore
            .collection('users')
            .doc(userId)
            .update({'placesRatings': newRatings});
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<List<Place>> getPlaces() => _fStore
      .collection('places')
      .orderBy('country')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((gotPlace) => Place.fromJson(gotPlace)).toList());

  Stream<List<Quiz>> getQuizes() => _fStore
      .collection('quizzes')
      .orderBy('section')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((gotQuiz) {
            return Quiz.fromJson(gotQuiz);
          }).toList());
}
