import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/service/Provider/them_app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../core/service/Provider/localization_app_service.dart';
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
    final themProvider=Provider.of<ThemAppService>(context);
    final localeProvider=Provider.of<LocalizationAppService>(context);
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
          value: themProvider.currentThem==ThemeMode.dark,
          trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
          onChanged: (value) {
            if (value) {
              themProvider.changThem(ThemeMode.dark,);
            } else {
              themProvider.changThem(ThemeMode.light,);
            }
          },
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
          trailing: DropdownMenu<Locale>(
            textStyle: textTheme.labelSmall,
            initialSelection:context.locale,
            onSelected: (value) {
              if (value == null) return;
              localeProvider.changLocal(value,context);
              log("suc");
            },
            textAlign: TextAlign.end,
            scrollPadding: EdgeInsets.zero,
            inputDecorationTheme: const InputDecorationTheme(
              hoverColor: Colors.transparent,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              contentPadding: EdgeInsetsDirectional.symmetric(
                vertical: AppPadding.p10,
              ),
            ),
            menuStyle: MenuStyle(
              alignment: AlignmentDirectional.center,
              backgroundColor: const WidgetStatePropertyAll(
                Colors.white54,
              ),
              side: WidgetStatePropertyAll(
                BorderSide(
                  color: colorThem.primaryColorLight,
                  strokeAlign: .minPositive
                )
              ),
              shadowColor: WidgetStatePropertyAll(colorThem.primaryColor,),
              elevation: const WidgetStatePropertyAll(6),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppBorderRadius.r16),
                ),
              ),
            ),
            alignmentOffset: const Offset(-50, 16),
            dropdownMenuEntries: [
              DropdownMenuEntry(
                value: const Locale("ar"),
                label: AppText.ar,
              ),
              DropdownMenuEntry(
                value: const Locale("en"),
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
