import 'package:evently_app/core/models/auth_model.dart';
import 'package:flutter/cupertino.dart';

class AuthServicesProvider extends ChangeNotifier {
  AuthModel? user;

  Future<AuthModel?>? streamUser(AuthModel? user)async{
    this.user= user;
    return user;
  }
}