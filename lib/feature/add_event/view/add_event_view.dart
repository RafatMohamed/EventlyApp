import 'package:evently_app/core/widgets/custom_button_app.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/core/widgets/default_app_bar_app.dart';
import 'package:evently_app/feature/add_event/view/widgets/custom_tab_bar_add_edite_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../core/utilities/app_border_radius.dart';
import '../../../core/utilities/app_padding.dart';
import '../../../core/utilities/app_text.dart';
import '../../../generated/assets.dart';

class AddEventView extends StatelessWidget {
  static const String routeName = "/${AppText.routeAddEventViewApp}";
  const AddEventView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData colorThem = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: defaultAppBarApp(
        context,
        themeColor: colorThem,
        title: AppText.addEvent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.p16,
            vertical: AppPadding.p8,
          ),
          child: Column(
            spacing: AppPadding.p16,
            crossAxisAlignment: .start,
            children: [
              Container(
                padding: const EdgeInsetsDirectional.all(AppPadding.p10),
                height: size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(
                    AppBorderRadius.r16,
                  ),
                  color: colorThem.primaryColor,
                  border: Border.all(color: colorThem.unselectedWidgetColor),
                  image: DecorationImage(
                    image: AssetImage(Assets.images.png.sportLight.path),
                    fit: .fill,
                  ),
                ),
              ),
              const CustomTabBarAddEditeEvent(),
              const DefaultAddEvent(),
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultAddEvent extends StatefulWidget {
  const DefaultAddEvent({
    super.key,
  });

  @override
  State<DefaultAddEvent> createState() => _DefaultAddEventState();
}

class _DefaultAddEventState extends State<DefaultAddEvent> {
  DateTime? dateSelect;
  TimeOfDay? timeSelect;
  var formate = DateFormat("dd MMM,yyyy");
  GlobalKey<FormState> formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ThemeData colorThem = Theme.of(context);

    Future<void> chooseDate() async {
      DateTime? dateTime = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 100)),
        initialDate: dateSelect,
        initialEntryMode: .calendarOnly,
      );
      setState(() {
        dateSelect = dateTime;
      });
    }

    Future<void> chooseTime() async {
      TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialEntryMode: TimePickerEntryMode.dial,
        initialTime: TimeOfDay.now(),
      );
      setState(() {
        timeSelect = timeOfDay;
      });
    }
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: .start,
        spacing: AppPadding.p16,
        children: [
          Text(
            AppText.title,
            style: textTheme.bodySmall?.copyWith(
              color: colorThem.primaryColorLight,
            ),
          ),
          const CustomTextFormField(
            hintText: "${AppText.event} ${AppText.title}",
            textInputAction: .next,
            keyboardType: .text,
          ),
          Text(
            AppText.desc,
            style:textTheme.bodySmall?.copyWith(
              color: colorThem.primaryColorLight,
            ),
          ),
          const CustomTextFormField(
            hintText: "${AppText.event} ${AppText.desc}",
            textInputAction: .done,
            keyboardType: .multiline,
            maxLines: 5,
          ),
          CustomBuildChooseDate(
            title: AppText.eventDate,
            trailTitle: dateSelect != null
                ? formate.format(dateSelect!)
                : AppText.chooseDate,
            iconPath: Assets.icons.calendarAdd.path,
            chooseDate: () => chooseDate(),
          ),
          CustomBuildChooseDate(
            title: AppText.eventTime,
            trailTitle:timeSelect != null
                ?timeSelect!.format(context)
                : AppText.chooseTime,
            iconPath: Assets.icons.clock.path,
            chooseDate: chooseTime,
          ),
          CustomButtonApp(onTap: () {}, text: AppText.addEvent)
        ],
      ),
    );
  }
}

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
