import 'package:evently_app/core/models/tab_bar_categories_model.dart';
import 'package:evently_app/core/service/EventServiceFirebase/event_services.dart';
import 'package:evently_app/core/service/Provider/get_event_services.dart';
import 'package:evently_app/core/utilities/helper/custom_snack_bar_app.dart';
import 'package:evently_app/core/utilities/helper/custom_widget_loading_data.dart';
import 'package:evently_app/core/widgets/custom_button_app.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../core/utilities/app_padding.dart';
import '../../../../core/utilities/app_text.dart';
import '../../../../generated/assets.dart';
import '../../model/event_model.dart';
import '../../services/add_event.dart';
import 'custom_build_choose_date.dart';

class DefaultAddEvent extends StatefulWidget {
  const DefaultAddEvent({
    super.key,
    required this.categorie,
    required this.pathImage,
    this.event,
  });
  final CategoriesModel categorie;
  final String pathImage;
  final EventModel? event;
  @override
  State<DefaultAddEvent> createState() => _DefaultAddEventState();
}

class _DefaultAddEventState extends State<DefaultAddEvent> {
  bool isLoading = false;
  DateTime? dateSelect;
  TimeOfDay? timeSelect;
  var formate = DateFormat("dd MMM,yyyy");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descController;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.event?.title);
    descController = TextEditingController(text: widget.event?.desc);
    dateSelect = widget.event != null
        ? DateTime(
            widget.event!.dateTime.year,
            widget.event!.dateTime.month,
            widget.event!.dateTime.day,
          )
        : null;
    timeSelect = widget.event != null
        ? TimeOfDay(
            hour: widget.event!.dateTime.hour,
            minute: widget.event!.dateTime.minute,
          )
        : null;
    super.initState();
  }

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
          IgnorePointer(
            ignoring: isLoading,
            child: isLoading
                ? CustomWidgetLoadingData.circleProgrees(colorThem)
                : CustomButtonApp(
                    onTap: widget.event != null ? updateEvent : addEvent,
                    text: widget.event != null
                        ? AppText.updateEvent
                        : AppText.addEvent,
                  ),
          ),
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
      setState(() {
        isLoading = true;
      });
      AddEventServices.addEvent(event)
          .then((_) {
            if (!mounted) return;
            ShowMess.successMess(context: context, mess: "Add Event Success");
            Navigator.of(context).pop();
            Provider.of<GetEventServicesProvider>(
              context,
              listen: false,
            ).getAllEvent();
          })
          .catchError((error) {
            setState(() {
              isLoading = false;
            });
            if (!mounted) return;
            ShowMess.successMess(
              context: context,
              mess: "Failed Add Event $error",
            );
          });
    }
  }

  Future<void> updateEvent() async {
    if (formKey.currentState!.validate() &&
        dateSelect != null &&
        timeSelect != null) {
      EventModel event = EventModel(
        title: titleController.text,
        desc: descController.text,
        eventID: widget.event?.eventID,
        eventOwner: widget.event?.eventOwner==null
            ? widget.event?.eventOwner
            : FirebaseAuth.instance.currentUser?.uid,
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
      setState(() {
        isLoading = true;
      });
      EventServicesFirebase.updateEventFirebase(event)
          .then((_) {
            if (!mounted) return;
            ShowMess.successMess(
              context: context,
              mess: "Update Event Success",
            );
            Navigator.of(context).pop(event);
            Provider.of<GetEventServicesProvider>(
              context,
              listen: false,
            ).getAllEvent();
          })
          .catchError((error) {
            setState(() {
              isLoading = false;
            });
            if (!mounted) return;
            ShowMess.successMess(
              context: context,
              mess: "Failed Update Event $error",
            );
          });
    }
  }
}
