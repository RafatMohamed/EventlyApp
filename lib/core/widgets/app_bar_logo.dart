import 'package:flutter/material.dart';

import '../../generated/assets.dart';

class AppBarLogo extends StatelessWidget {
  const AppBarLogo({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Image.asset(
      Assets.images.png.logo.path,
      alignment: .center,
      fit: .fill,
      width: size.width * 0.5,
    );
  }
}
