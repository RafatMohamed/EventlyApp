import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/service/Provider/localization_app_service.dart';
import 'package:evently_app/core/service/Provider/them_app_service.dart';
import 'package:evently_app/core/utilities/app_text.dart';
import 'package:evently_app/feature/on_boarding/model/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../generated/assets.dart';
import 'custom_build_indicator.dart';
import 'custom_build_select_lang_them.dart';
import 'custom_show_image_on_boarding.dart';

class OnBoardingItem extends StatefulWidget {
  const OnBoardingItem({
    super.key,
    required this.item,
    required this.currentIndex,
    required this.onTapIndicator,
  });

  final OnBoardingModel item;
  final int currentIndex;
  final Function(int) onTapIndicator;

  @override
  State<OnBoardingItem> createState() => _OnBoardingItemState();
}

class _OnBoardingItemState extends State<OnBoardingItem> {
  @override
  Widget build(BuildContext context) {
    final themProvider = Provider.of<ThemAppService>(context);
    final langProvider = Provider.of<LocalizationAppService>(context);
    int isEnLan = context.locale == const Locale("en") ? 0 : 1;
    int isLightThem = themProvider.currentThem == ThemeMode.dark ? 1 : 0;
    final Size size = MediaQuery.sizeOf(context);
    final ThemeData themData = Theme.of(context);

    final List<Widget> listLang = [
      Text(
        AppText.en,
        style: themData.textTheme.labelSmall?.copyWith(
          color: isEnLan == 0 ? themData.disabledColor : themData.primaryColor,
        ),
      ),
      Text(
        AppText.ar,
        style: themData.textTheme.labelSmall?.copyWith(
          color: isEnLan == 1 ? themData.disabledColor : themData.primaryColor,
        ),
      ),
    ];
    final List<Widget> listThem = [
      SvgPicture.asset(
        Assets.icons.lightMode.path,
        fit: .scaleDown,
        colorFilter: ColorFilter.mode(
          isLightThem == 0 ? themData.disabledColor : themData.primaryColor,
          BlendMode.srcIn,
        ),
      ),
      SvgPicture.asset(
        Assets.icons.darkMode.path,
        fit: .scaleDown,
        colorFilter: ColorFilter.mode(
          isLightThem == 1 ? themData.disabledColor : themData.primaryColor,
          BlendMode.srcIn,
        ),
      ),
    ];

    return Column(
      spacing: 24,
      children: [
        Column(
          spacing: 8,
          children: [
            CustomImageShowOnBoarding(size: size, item: widget.item),
            CustomIndicator(widget: widget, onTap: widget.onTapIndicator),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            spacing: 8,
            children: [
              Text(widget.item.title, style: themData.textTheme.bodyMedium),
              Expanded(
                child: Text(
                  widget.item.desc,
                  style: themData.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: widget.currentIndex == 0,
          child: Column(
            spacing: 16,
            children: [
              CustomBuildSelectLangWithThem(
                currentSelected: isEnLan,
                label: AppText.lang,
                listContainer: listLang,
                onTap: (inx) {
                  if (isEnLan == inx) return;
                  langProvider.changLocal(
                    inx == 0 ? const Locale("en") : const Locale("ar"),
                    context,
                  );
                  setState(() {});
                },
              ),
              CustomBuildSelectLangWithThem(
                currentSelected: isLightThem,
                label: AppText.theme,
                listContainer: listThem,
                onTap: (inx) {
                  isLightThem=inx;
                  themProvider.changThem(
                    inx == 0 ? ThemeMode.light : ThemeMode.dark,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
