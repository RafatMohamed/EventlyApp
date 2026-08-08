import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../feature/event/model/event_model.dart';
import '../AuthServicesFirebase/auth_services_firebase.dart';

class EventServicesFirebase {
  static CollectionReference<EventModel> eventRef = FirebaseFirestore.instance
      .collection('Events')
      .withConverter<EventModel>(
        fromFirestore: (snapshot, _) =>
            EventModel.fromFirebase(snapshot.data()!),
        toFirestore: (event, _) => event.toJsonFirebase(),
      );

  static CollectionReference<Map<String, dynamic>> get favouriteEventRef {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return AuthServicesFirebase.authRef.doc(uid).collection("favourite");
  }

  static Future<void> addEventFirebase(EventModel event) {
    DocumentReference docRef = eventRef.doc();
    event.eventID = docRef.id;
    event.eventOwner = FirebaseAuth.instance.currentUser!.uid;
    return docRef.set(event);
  }

  static Future<void> addEventFavourite({required EventModel event}) {
    return favouriteEventRef.doc(event.eventID).set({"eventID": event.eventID});
  }

  static Future<void> removeEventFavourite({required EventModel event}) {
    return favouriteEventRef.doc(event.eventID).delete();
  }

  static Future<List<EventModel>> getEventFavourite() async {
    List<EventModel> favResultEvents = [];
    var snapShote = await favouriteEventRef.get();

    for (final doc in snapShote.docs) {
      final eventSnapshot = await eventRef.doc(doc.id).get();

      if (eventSnapshot.exists) {
        favResultEvents.add(eventSnapshot.data()!);
      }
    }
    return favResultEvents;
  }

  static Future<Set<String>> getAllIDDocFavourite() async {
    final eventSnapshot = await favouriteEventRef.get();
    return eventSnapshot.docs.map((e) {
      return e.id;
    }).toSet();
  }

  static Future<void> deleteEventFirebase(String? eventID) async {
    return await eventRef.doc(eventID).delete();
  }

  static Future<void> updateEventFirebase(EventModel event) async {
    return await eventRef.doc(event.eventID).update(event.toJsonFirebase());
  }

  static Future<List<EventModel>> getEventFirebase() async {
    var snapShot = await eventRef.orderBy("dateTime").get();
    return snapShot.docs.map((e) {
      return e.data();
    }).toList();
  }

  static Future<List<EventModel>> getMYEventFirebase(String eventId) async {
    var snapShot = await eventRef
        .where("eventOwner", isEqualTo: eventId)
        .orderBy("dateTime")
        .get();
    return snapShot.docs.map((e) {
      return e.data();
    }).toList();
  }
}
