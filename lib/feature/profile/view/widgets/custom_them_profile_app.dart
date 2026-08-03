import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/service/them_app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utilities/app_border_radius.dart';
import '../../../../core/utilities/app_padding.dart';
import '../../../../core/utilities/app_text.dart';
import '../../../../generated/assets.dart';
import 'custom_build_list_tile.dart';

class CustomBuildThemProfileApp extends StatefulWidget {
  const CustomBuildThemProfileApp({
    super.key,
    required this.colorThem,
    required this.textTheme,
  });

  final ThemeData colorThem;
  final TextTheme textTheme;

  @override
  State<CustomBuildThemProfileApp> createState() =>
      _CustomBuildThemProfileAppState();
}

class _CustomBuildThemProfileAppState extends State<CustomBuildThemProfileApp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        SwitchListTile(
          tileColor: widget.colorThem.disabledColor,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.r16),
            borderSide: BorderSide(
              color: widget.colorThem.unselectedWidgetColor,
            ),
          ),
          contentPadding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p10,
          ),
          hoverColor: Colors.transparent,
          thumbColor: const WidgetStatePropertyAll(Colors.white),
          value: ThemAppService.currentThem == ThemeMode.dark,
          trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
          onChanged: (value) {
            if (value) {
              ThemAppService.changThem(ThemeMode.dark, () {
                setState(() {});
              });
            } else {
              ThemAppService.changThem(ThemeMode.light, () {
                setState(() {});
              });
            }
            setState(() {});
          },
          title: Text(
            AppText.darkMode,
            style: widget.textTheme.bodySmall?.copyWith(
              color: widget.colorThem.primaryColorLight,
            ),
          ),
          activeTrackColor: widget.colorThem.primaryColor,
          inactiveTrackColor: widget.colorThem.secondaryHeaderColor,
          overlayColor: WidgetStatePropertyAll(widget.colorThem.disabledColor),
        ),
        CustomBuildListTile(
          title: AppText.lang,
          trailing: DropdownMenu<Locale>(
            textStyle: widget.textTheme.labelSmall,
            initialSelection: context.locale,
            onSelected: (value) {
              if (value == null) return;
              if (context.locale == value) return;
              context.setLocale(value);
              setState(() {});
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
                  color: widget.colorThem.primaryColorLight,
                  strokeAlign: .minPositive
                )
              ),
              shadowColor: WidgetStatePropertyAll(widget.colorThem.primaryColor,),
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
