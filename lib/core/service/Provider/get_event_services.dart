import 'package:evently_app/feature/add_event/model/event_model.dart';
import 'package:flutter/material.dart';

import '../EventServiceFirebase/event_services.dart';

class GetEventServicesProvider extends ChangeNotifier{
  List<EventModel> allEvent=[];
  List<EventModel> filteredEvent=[];
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
}