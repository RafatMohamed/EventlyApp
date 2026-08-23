import 'package:evently_app/core/service/EventServiceFirebase/event_services.dart';
import 'package:flutter/foundation.dart';

import '../../event/model/event_model.dart';

class FavouriteEventServicesProvider extends ChangeNotifier {
  FavouriteEventServicesProvider() {
    intiFavouriteProvider();
  }
  Set<String> isFavouriteID = {};
  List<EventModel> myFavouriteEvent = [];
  List<EventModel> myFavouriteEventFilteredSearch = [];

  Future<void> intiFavouriteProvider() async {
    myFavouriteEvent = await EventServicesFirebase.getEventFavourite();
    notifyListeners();
  }

  Future<void> addFavourite(EventModel event) async {
    await EventServicesFirebase.addEventFavourite(event: event);
    myFavouriteEvent.add(event);
    // myFavouriteEventFilteredSearch.add(event);
    notifyListeners();
  }

  Future<void> remove(EventModel event) async {
    await EventServicesFirebase.removeEventFavourite(event: event);
    // isFavouriteID.remove(event.eventID);
    myFavouriteEvent.removeWhere((element) {
      return element.eventID == event.eventID;
    });
    // myFavouriteEventFilteredSearch.removeWhere((element) {
    //  return element.eventID==event.eventID;
    // },);
    notifyListeners();
  }

  Future<List<EventModel>> getFavouriteMyEvent() async {
    myFavouriteEvent = await EventServicesFirebase.getEventFavourite();
    myFavouriteEventFilteredSearch = myFavouriteEvent;
    notifyListeners();
    return myFavouriteEventFilteredSearch;
  }

  void searchFavouriteMyEvent(String query) async {
    if (query.isEmpty) {
      myFavouriteEventFilteredSearch = myFavouriteEvent;
    } else {
      myFavouriteEventFilteredSearch = myFavouriteEvent.where((element) {
        return element.title.trim().toLowerCase() ==
                query.trim().toLowerCase() ||
            element.desc.trim().toLowerCase() == query.trim().toLowerCase();
      }).toList();
    }
    notifyListeners();
  }

  bool getIsFavouriteEvent(EventModel event) {
    isFavouriteID = myFavouriteEvent.where((event) {
          return event.eventID != null;
        }).map((e) {
          return e.eventID.toString();
        }).toSet();
    return isFavouriteID.contains(event.eventID);
  }
}
