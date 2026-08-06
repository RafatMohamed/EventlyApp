import 'package:evently_app/core/models/auth_model.dart';
import 'package:flutter/cupertino.dart';

class AuthServicesProvider extends ChangeNotifier {
  AuthModel? user;

  void streamUser(AuthModel? user){
    this.user= user;
    notifyListeners();
  }
}