import 'package:evently_app/core/service/EventServiceFirebase/event_services.dart';
import '../model/event_model.dart';

class AddEventServices {
  static Future<void> addEvent(EventModel event)async{
   await EventServicesFirebase.addEventFirebase(event);
  }
 }