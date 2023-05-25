import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthier/entity/course_hive.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../../api/date_format/date_format.dart';
import '../../../api/resource/resource.dart';
import '../../../const/const.dart';
import '../../../my_widgets/animated_icon_button.dart';
import '../../../my_widgets/my_avatar_photo.dart';
import '../../../my_widgets/my_button.dart';
import '../../../my_widgets/my_date_text_field.dart';
import '../../../my_widgets/my_drop_down_text_field.dart';
import '../../../my_widgets/my_text_field.dart';
import '../../../my_widgets/my_time_interval.dart';
import '../../../my_widgets/my_toast.dart';
import 'edit_courses_model.dart';

class EditCoursesProviderWidget extends StatelessWidget {
  const EditCoursesProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = ModalRoute.of(context)!.settings.arguments as List;
    return ChangeNotifierProvider(
        create: (context) => EditCoursesModel(),
        child: EditRecipes(
          list: list,
        ));
  }
}

class EditRecipes extends StatelessWidget {
  final List list;
  bool tumbler = false;
  EditRecipes({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<EditCoursesModel>();

    int listIndex = list[0];
    CourseHive courseHive = list[1];
    if (tumbler == false) {
      model.namePill = courseHive.namePill;
      model.photoPill = courseHive.photoPill;
      model.oldPhotoPill = courseHive.photoPill;
      model.descriptionPill = courseHive.descriptionPill;
      model.timeOfReceipt = courseHive.timeOfReceipt;
      model.startNamePill = courseHive.startNamePill!;
      model.endNamePill = courseHive.endNamePill;
      model.periodicity = courseHive.periodicity;
      tumbler = !tumbler;
    }
    final TextEditingController namePillController =
        TextEditingController(text: model.namePill);
    final TextEditingController descriptionPillController =
        TextEditingController(text: model.descriptionPill);

    String dropInitialValue(int value) {
      if (value == 0) {
        return AppLocalizations.of(context)!.daily;
      } else if (value == 1) {
        return AppLocalizations.of(context)!.in_one_day;
      } else {
        return AppLocalizations.of(context)!.in_two_days;
      }
    }

    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              model.namePill,
              style: MyTextStyle.textStyle25,
            ),
            actions: [
              AnimatedIconButton(
                  onPress: () async {
                    if (namePillController.text.isEmpty ||
                        descriptionPillController.text.isEmpty ||
                        model.timeOfReceipt.isEmpty) {
                      myToast(AppLocalizations.of(context)!.validation);
                      return;
                    }
                    model.saveEditCoursesToHive(listIndex);
                    model.saveCoursesToPush();
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.floppyDisk,
                    size: 25,
                  )),
              const SizedBox(
                width: 20,
              )
            ],
            centerTitle: true),
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20, top: 10),
                child: Row(
                  children: [
                    MyTextFieldDate(
                      onChanged: (value) =>
                          model.startNamePill = value as DateTime,
                      hintTextField: 'Начало',
                      onTab: () {
                        model.selectDateStart(context);
                      },
                      textEditingController: TextEditingController(
                        text: formatDateTime(model.startNamePill),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    MyTextFieldDate(
                        hintTextField: 'Конец',
                        onTab: () {
                          model.selectDateEnd(context);
                        },
                        textEditingController: TextEditingController(
                            text: model.endNamePill == null
                                ? 'Без срока'
                                : formatDateTime(model.endNamePill!))),
                    SizedBox(
                      width: 5,
                    ),
                    MyDropDownTextField(
                        onChanged: (val) {
                          val as DropDownValueModel;
                          model.periodicity = val.value;
                          print(val.value);
                        },
                        initialValue: dropInitialValue(model.periodicity)),
                  ],
                ),
              ),
              MyTextField(
                  onChanged: (value) => model.namePill = value,
                  hintTextField: AppLocalizations.of(context)!.namePill,
                  controller: namePillController),
              MyTextField(
                onChanged: (value) => model.descriptionPill = value,
                hintTextField: AppLocalizations.of(context)!.descriptionPill,
                controller: descriptionPillController,
                maxLine: 3,
              ),
              MyButton(
                  myText: Text(AppLocalizations.of(context)!.change_photo),
                  onPress: () {
                    model.myShowAdaptiveActionSheet(context);
                  }),
              MyAvatarPhoto(
                  photo: model.photoPill == null
                      ? Image.asset(Resource.pills, fit: BoxFit.cover)
                      : Image.file(File(model.photoPill!), fit: BoxFit.cover)),
              MyButton(
                  myText: Text(AppLocalizations.of(context)!.add_time_pills),
                  onPress: () {
                    model.addTime(context);
                  }),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 300,
                  child: ListView.builder(
                      itemCount: model.timeOfReceipt.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MyTimeInterval(
                          count: model.timeOfReceipt.length,
                          titleText: model.timeOfReceipt[index],
                          onPress: () {
                            model.delTime(index);
                          },
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
