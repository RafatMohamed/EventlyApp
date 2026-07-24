import 'package:flutter/material.dart';
import '../../../../core/utilities/app_colors.dart';
import '../../../../generated/assets.dart';

class CustomBuildInfoPerson extends StatelessWidget {
  const CustomBuildInfoPerson({
    super.key,
    required this.colorThem,
    required this.textTheme,
    required this.isLight,
  });

  final ThemeData colorThem;
  final TextTheme textTheme;
  final bool isLight;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(Assets.images.png.logoRoute.path),
          radius: MediaQuery.sizeOf(context).width * 0.15,
        ),
        const SizedBox(height: 16),
        Text("Raafat Mohamed", style: textTheme.bodyMedium),
        const SizedBox(height: 4),
        Text(
          "raafatm2001@gmail.com",
          style: textTheme.labelSmall?.copyWith(
            fontWeight: .w400,
            color: isLight ? AppColors.secTextLight : AppColors.secTextDark,
          ),
        ),
      ],
    );
  }
}
