import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/event_model.dart';

class AddEventFirestoreService {
 static CollectionReference<EventModel> eventRef = FirebaseFirestore.instance.collection('Events').withConverter<EventModel>(
  fromFirestore: (snapshot, _) => EventModel.fromFirebase(snapshot.data()!),
  toFirestore: (event, _) => event.toJsonFirebase(),
  );
 static Future<void> addEvent(EventModel event){
    DocumentReference docRef = eventRef.doc();
    event.eventID = docRef.id;
   return docRef.set(event);
  }
}