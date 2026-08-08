import 'package:evently_app/core/service/EventServiceFirebase/event_services.dart';
import 'package:flutter/foundation.dart';

import '../../event/model/event_model.dart';

class FavouriteEventServicesProvider extends ChangeNotifier {

  FavouriteEventServicesProvider(){
    intiFavouriteProvider();
  }
  Set<String> isFavouriteID = {};
  List<EventModel> myFavouriteEvent = [];

  Future<void> intiFavouriteProvider() async {
    isFavouriteID = await EventServicesFirebase.getAllIDDocFavourite();
  }

  Future<void> addFavourite(EventModel event) async {
    await EventServicesFirebase.addEventFavourite(event: event);
    isFavouriteID.add(event.eventID!);
    notifyListeners();
  }

  Future<void> remove(EventModel event) async {
    await EventServicesFirebase.removeEventFavourite(event: event);
    isFavouriteID.remove(event.eventID);
    notifyListeners();
  }

  Future<List<EventModel>> getFavouriteMyEvent() async {
    myFavouriteEvent = await EventServicesFirebase.getEventFavourite();
    notifyListeners();
    return myFavouriteEvent;
  }

  bool getIsFavouriteEvent(EventModel event) {
    return isFavouriteID.contains(event.eventID);
  }
}
