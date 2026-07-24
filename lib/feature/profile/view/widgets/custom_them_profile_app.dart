import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utilities/app_border_radius.dart';
import '../../../../core/utilities/app_padding.dart';
import '../../../../core/utilities/app_text.dart';
import '../../../../generated/assets.dart';
import 'custom_build_list_tile.dart';

class CustomBuildThemProfileApp extends StatelessWidget {
  const CustomBuildThemProfileApp({
    super.key,
    required this.colorThem,
    required this.textTheme,
  });

  final ThemeData colorThem;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        SwitchListTile(
          tileColor: colorThem.disabledColor,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.r16),
            borderSide: BorderSide(
              color: colorThem.unselectedWidgetColor,
            ),
          ),
          contentPadding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p10,
          ),
          hoverColor: Colors.transparent,
          thumbColor: const WidgetStatePropertyAll(Colors.white),
          value: false,
          trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
          onChanged: (value) {},
          title: Text(
            AppText.darkMode,
            style: textTheme.bodySmall?.copyWith(
              color: colorThem.primaryColorLight,
            ),
          ),
          activeTrackColor: colorThem.primaryColor,
          inactiveTrackColor: colorThem.secondaryHeaderColor,
          overlayColor: WidgetStatePropertyAll(colorThem.disabledColor),
        ),
        CustomBuildListTile(
          title: AppText.lang,
          trailing: DropdownMenu<String>(
            textStyle: textTheme.labelSmall,
            textAlign: TextAlign.end,
            scrollPadding: EdgeInsets.zero,
            inputDecorationTheme: const InputDecorationTheme(
              hoverColor: Colors.transparent,
              enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent
                  )
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent
                  )
              ),
              contentPadding: EdgeInsetsDirectional.symmetric(
                vertical: AppPadding.p10,
              ),
            ),
            menuStyle: MenuStyle(
              alignment: AlignmentDirectional.center,
              backgroundColor: WidgetStatePropertyAll(
                colorThem.scaffoldBackgroundColor,
              ),
              elevation: const WidgetStatePropertyAll(6),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppBorderRadius.r16),
                ),
              ),
            ),
            alignmentOffset: const Offset(-50,16),
            dropdownMenuEntries: const [
              DropdownMenuEntry(
                value: AppText.ar,
                label:AppText.ar,
              ),
              DropdownMenuEntry(
                value: AppText.en,
                label: AppText.en,
              ),
            ],
          ),
        ),
        CustomBuildListTile(
          title: AppText.logOut,
          trailing: SvgPicture.asset(Assets.icons.logout.path),
        ),
      ],
    );
  }
}
