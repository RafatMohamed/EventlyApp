import 'package:flutter/material.dart';
import '../../../../core/utilities/app_border_radius.dart';

class CustomBuildListTile extends StatelessWidget {
  const CustomBuildListTile({
    super.key,
    required this.title,
    required this.trailing,
  });

  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ThemeData colorThem = Theme.of(context);
    return ListTile(
      tileColor: colorThem.disabledColor,
      hoverColor: Colors.transparent,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.r16),
        borderSide: BorderSide(color: colorThem.unselectedWidgetColor),
      ),
      leading: Text(
        title,
        style: textTheme.bodySmall?.copyWith(
          color: colorThem.primaryColorLight,
        ),
      ),
      trailing: trailing,
    );
  }
}
