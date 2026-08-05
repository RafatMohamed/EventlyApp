import 'dart:developer';

import 'package:evently_app/core/models/tab_bar_categories_model.dart';
import 'package:evently_app/core/service/EventServiceFirebase/event_services.dart';
import 'package:evently_app/core/utilities/app_text_styles.dart';
import 'package:evently_app/core/utilities/helper/custom_snack_bar_app.dart';
import 'package:evently_app/core/widgets/custom_button_app.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/feature/add_event/model/event_model.dart';
import 'package:evently_app/feature/add_event/services/add_event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/utilities/app_padding.dart';
import '../../../../core/utilities/app_text.dart';
import '../../../../generated/assets.dart';
import 'custom_build_choose_date.dart';

class DefaultAddEvent extends StatefulWidget {
  const DefaultAddEvent({
    super.key,
    required this.categorie,
    required this.pathImage,
  });
  final CategoriesModel categorie;
  final String pathImage;
  @override
  State<DefaultAddEvent> createState() => _DefaultAddEventState();
}

class _DefaultAddEventState extends State<DefaultAddEvent> {
  DateTime? dateSelect;
  TimeOfDay? timeSelect;
  var formate = DateFormat("dd MMM,yyyy");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
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
          CustomTextFormField(
            hintText: "${AppText.event} ${AppText.title}",
            textInputAction: .next,
            keyboardType: .text,
            controller: titleController,
            isName: true,
            withValidator: true,
          ),
          Text(
            AppText.desc,
            style: textTheme.bodySmall?.copyWith(
              color: colorThem.primaryColorLight,
            ),
          ),
          CustomTextFormField(
            hintText: "${AppText.event} ${AppText.desc}",
            textInputAction: .done,
            keyboardType: .multiline,
            maxLines: 5,
            controller: descController,
            isName: true,
            withValidator: true,
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
            trailTitle: timeSelect != null
                ? timeSelect!.format(context)
                : AppText.chooseTime,
            iconPath: Assets.icons.clock.path,
            chooseDate: chooseTime,
          ),
          CustomButtonApp(onTap: addEvent, text: AppText.addEvent),
        ],
      ),
    );
  }

  Future<void> addEvent() async {
    if (formKey.currentState!.validate() &&
        dateSelect != null &&
        timeSelect != null) {
      EventModel event = EventModel(
        title: titleController.text,
        desc: descController.text,
        pathImage: widget.pathImage,
        dateTime: DateTime(
          dateSelect!.year,
          dateSelect!.month,
          dateSelect!.day,
          timeSelect!.hour,
          timeSelect!.minute,
        ),
        categories: widget.categorie,
      );
      AddEventServices.addEvent(event).then((_){
        ShowMess.successMess(context: context, mess: "Add Event Success");
        Navigator.of(context).pop();
      }).catchError((error){
        ShowMess.successMess(context: context, mess: "Failed Add Event $error");
      });
    }
  }
}
