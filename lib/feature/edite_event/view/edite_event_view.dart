import 'package:flutter/material.dart';

import '../../../core/utilities/app_text.dart';

class EditeEventView extends StatelessWidget {
  static const String routeName = "/${AppText.routeEditeEventViewApp}";
  const EditeEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(),body: Center(child: Text("Edite",style: Theme.of(context).textTheme.titleMedium,)));
  }
}
