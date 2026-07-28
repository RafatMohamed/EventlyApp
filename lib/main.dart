import 'package:evently_app/core/shared/storge_local_hive.dart';
import 'package:flutter/material.dart';
import 'app/my_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StorgeLocalHive.instance.initSharedMain();
  runApp(const EventlyApp());
}

