import 'package:flutter/material.dart';

import '../../../core/utilities/app_text.dart';

class FavoriteView extends StatelessWidget {
  static const String routeName = "/${AppText.routeFavoriteViewApp}";
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(child: Text("Favorite",style: Theme.of(context).textTheme.titleMedium,));
  }
}
