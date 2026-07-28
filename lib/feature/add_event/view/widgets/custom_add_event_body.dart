import 'package:evently_app/core/widgets/custom_button_app.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/utilities/app_padding.dart';
import '../../../../core/utilities/app_text.dart';
import '../../../../generated/assets.dart';
import '../add_event_view.dart';


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
