import 'package:easy_localization/easy_localization.dart';
import 'package:evently_app/core/shared/storge_local_hive.dart';
import 'package:evently_app/core/utilities/app_padding.dart';
import 'package:evently_app/core/utilities/app_text.dart';
import 'package:evently_app/feature/main_app_view/view/main_app_view.dart';
import 'package:evently_app/feature/on_boarding/model/on_boarding_model.dart';
import 'package:evently_app/generated/assets.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_button_app.dart';
import 'on_boarding_item.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> itemsOnBoarding = [
      OnBoardingModel(
        pathImage: Assets.images.svg.beingCreative.path,
        title: AppText.title0OnBoarding.tr(context: context),
        desc: AppText.desc0OnBoarding,
      ),
      OnBoardingModel(
        pathImage: Assets.images.svg.hotTrending.path,
        title: AppText.title1OnBoarding,
        desc: AppText.desc1OnBoarding,
      ),
      OnBoardingModel(
        pathImage: Assets.images.svg.beingCreative2.path,
        title: AppText.title2OnBoarding,
        desc: AppText.desc2OnBoarding,
      ),
      OnBoardingModel(
        pathImage: Assets.images.svg.beingCreative3.path,
        title: AppText.title3OnBoarding,
        desc: AppText.desc3OnBoarding,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p24),
      child: Column(
        spacing: 24,
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              itemCount: itemsOnBoarding.length,
              itemBuilder: (context, index) {
                final item = itemsOnBoarding[index];
                return OnBoardingItem(
                  item: item,
                  currentIndex: currentIndex,
                  onTapIndicator: (index) {
                    animateChangePage(index);
                  },
                );
              },
            ),
          ),
          CustomButtonApp(
            onTap: () {
              if (currentIndex == itemsOnBoarding.length - 1) {
               navigationToMainView();
              }
              animateChangePage(currentIndex + 1);
            },
            text: currentIndex == 0
                ? AppText.letsStart
                : currentIndex == itemsOnBoarding.length - 1
                ? AppText.getStarted
                : AppText.next,
          ),
        ],
      ),
    );
  }

  Future<void> animateChangePage(int index) {
    return pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  Future<void> navigationToMainView() {
    StorgeLocalHive.instance.saveIsFirstOpenApp(false);
    return  Navigator.pushReplacementNamed(context, MainAppView.routeName);
  }
}
