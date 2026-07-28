import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBuildChooseDate extends StatelessWidget {
  const CustomBuildChooseDate({
    super.key,
    required this.title,
    required this.iconPath,
    required this.chooseDate,
    required this.trailTitle,
  });

  final String title;
  final String trailTitle;
  final String iconPath;
  final Function() chooseDate;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ThemeData colorThem = Theme.of(context);
    return Row(
      children: [
        Row(
          spacing: 8,
          mainAxisAlignment: .center,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                colorThem.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            Text(
              title,
              style: textTheme.bodySmall?.copyWith(
                color: colorThem.primaryColorLight,
              ),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: chooseDate,
          child: Text(
            trailTitle,
            style: textTheme.labelSmall?.copyWith(
              fontWeight: .w400,
              decoration: .underline,
            ),
          ),
        ),
      ],
    );
  }
}
