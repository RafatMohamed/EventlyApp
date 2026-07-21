import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/on_boarding_model.dart';

class CustomImageShowOnBoarding extends StatelessWidget {
  const CustomImageShowOnBoarding({
    super.key,
    required this.size,
    required this.item,
  });

  final Size size;
  final OnBoardingModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height*.35,
      child: SvgPicture.asset(item.pathImage, fit: .fill),
    );
  }
}
