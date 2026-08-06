import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../feature/add_event/model/event_model.dart';

class EventServicesFirebase {
  static CollectionReference<EventModel> eventRef = FirebaseFirestore.instance
      .collection('Events')
      .withConverter<EventModel>(
        fromFirestore: (snapshot, _) =>
            EventModel.fromFirebase(snapshot.data()!),
        toFirestore: (event, _) => event.toJsonFirebase(),
      );
  static Future<void> addEventFirebase(EventModel event) {
    DocumentReference docRef = eventRef.doc();
    event.eventID = docRef.id;
    event.eventOwner = FirebaseAuth.instance.currentUser!.uid;
    return docRef.set(event);
  }

  static Future<List<EventModel>> getEventFirebase() async {
    var snapShot = await eventRef.orderBy("dateTime").get();
    return snapShot.docs.map((e) {
      return e.data();
    }).toList();
  }

  static Future<List<EventModel>> getMYEventFirebase(String eventId) async {
    var snapShot = await eventRef
        .where("eventOwner", isEqualTo:eventId)
        .orderBy("dateTime")
        .get();
    return snapShot.docs.map((e) {
      return e.data();
    }).toList();
  }
}
