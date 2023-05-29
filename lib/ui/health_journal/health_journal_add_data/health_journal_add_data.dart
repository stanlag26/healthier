import 'package:flutter/material.dart';
import 'package:healthier/const/const.dart';
import 'package:healthier/my_widgets/my_button_category.dart';

import '../../../my_widgets/my_text_field_for_categry.dart';
import '../../../my_widgets/my_time_interval_category.dart';





class HealthJournalAddData extends StatelessWidget {
  const HealthJournalAddData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Артериальное давление'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
          child: ListView(
            children: [
              Text(
                'Добавить измерение',
                style: MyTextStyle.textStyle25,
              ),
              SizedBox(
                height: 10,
              ),
              MyTextFieldCategory(
                labelText: 'Дата и время замера',
                readOnly: true,
                textEditingController: TextEditingController(text: 'Сейчас'),
              ),
              MyTextFieldCategory(
                labelText: ' Введите давление (120/80)',
                readOnly: false,
                textEditingController: TextEditingController(),
              ),
              MyButtonCategory(myText: const Text('Добавить'), onPress: (){}),
              SizedBox(
                height: 20,
              ),
              Text(
                'История',
                style: MyTextStyle.textStyle25,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 600,
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return MyTimeIntervalCategory(
                          count: 5,
                          titleText: '120/80',
                          subtitleText: '12:00 23.05.2023',
                          onPress: () {},
                        );
                      })),

            ],
          ),
        ),
      ),
    );
  }
}
