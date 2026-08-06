import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/models/tab_bar_categories_model.dart';

class EventModel {
  String? eventID;
  String? eventOwner;
  String title;
  String desc;
  String pathImage;
  CategoriesModel categories;
  DateTime dateTime;

  EventModel({
    required this.title,
    required this.desc,
    required this.pathImage,
    required this.dateTime,
    required this.categories,
    this.eventID = "",
    this.eventOwner="",
  });

  Map<String, dynamic> toJsonFirebase() => {
    "eventID":eventID,
    "eventOwner":eventOwner,
    "title": title,
    "desc": desc,
    "pathImage": pathImage,
    "dateTime": Timestamp.fromDate(dateTime),
    "categoriesID": categories.id,
  };

  factory EventModel.fromFirebase(Map<String, dynamic> event) {
    return EventModel(
      title: event["title"],
      eventID: event["eventID"],
      eventOwner: event["eventOwner"],
      desc: event["desc"],
      pathImage: event["pathImage"],
      dateTime: (event["dateTime"] as Timestamp).toDate(),
      categories: CategoriesModel.getListCategories().firstWhere(
        (element) => element.id == event["categoriesID"],
      ),
    );
  }
}
