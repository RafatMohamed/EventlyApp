import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../feature/event/model/event_model.dart';
import '../EventServiceFirebase/event_services.dart';

class GetEventServicesProvider extends ChangeNotifier{
  List<EventModel> allEvent=[];
  List<EventModel> filteredEvent=[];
  List<EventModel> myEvent=[];

  Future<void> getAllEvent()async{
    allEvent = await EventServicesFirebase.getEventFirebase();
    filteredEvent=allEvent;
    notifyListeners();
  }
  Future<void> getFilteredEvent(String categoriesId)async{
    filteredEvent = allEvent.where((element) {
      return element.categories.id==categoriesId;
    },).toList();
    notifyListeners();
  }

  Future<void> getMyEvent() async{
    myEvent = await EventServicesFirebase.getMYEventFirebase(FirebaseAuth.instance.currentUser!.uid.toString());
    notifyListeners();
  }
}