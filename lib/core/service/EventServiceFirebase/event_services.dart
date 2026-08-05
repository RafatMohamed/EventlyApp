import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../feature/add_event/model/event_model.dart';

class EventServicesFirebase {
  static CollectionReference<EventModel> eventRef = FirebaseFirestore.instance.collection('Events').withConverter<EventModel>(
    fromFirestore: (snapshot, _) => EventModel.fromFirebase(snapshot.data()!),
    toFirestore: (event, _) => event.toJsonFirebase(),
  );
  static Future<void> addEventFirebase(EventModel event){
    DocumentReference docRef = eventRef.doc();
    event.eventID = docRef.id;
    return docRef.set(event);
  }

  static Future<List<EventModel>> getEventFirebase()async{
    var snapShot =await eventRef.get();
    return snapShot.docs.map((e) {
      return e.data();
    },).toList();
  }

}