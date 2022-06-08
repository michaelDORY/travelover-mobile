import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelover_mobile/models/place.dart';

class Firestore {
  final FirebaseFirestore _fStore = FirebaseFirestore.instance;

  Stream<List<Place>> getPlaces() => _fStore
      .collection('places')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((gotPlace) {
        print("Got Place " + gotPlace.data().toString());
            Place place = Place.fromJson(gotPlace);
            print("PLace " + place.toString());
            return place;
          }).toList());
}
