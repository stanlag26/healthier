import 'package:flutter/material.dart';
import 'package:healthier/const/const.dart';
import 'package:healthier/my_widgets/my_button_category.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../my_widgets/my_text_field_for_categry.dart';
import '../../../my_widgets/my_time_interval_category.dart';
import 'health_journal_add_data_model.dart';


class HealthJournalAddDataProviderWidget extends StatelessWidget {
  const HealthJournalAddDataProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map <String, String> healthJournal = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return ChangeNotifierProvider.value(
        value:HealthJournalAddDataModel(), child: HealthJournalAddData(healthJournal: healthJournal,));
  }
}


class HealthJournalAddData extends StatelessWidget {
  const HealthJournalAddData({Key? key, required this.healthJournal}) : super(key: key);
  final Map <String, String> healthJournal;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<HealthJournalAddDataModel>();
    model.index = int.parse(healthJournal['id'] ?? '0');
    final DateFormat formatter = DateFormat('HH:mm, dd.MM.yyyy');
    
    return Scaffold(
      appBar: AppBar(
        title: Text(healthJournal['name'].toString()),
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
                onTab: () {model.selectStartIndication(context);},
                labelText: 'Дата и время замера',
                readOnly: true,
                textEditingController: TextEditingController(text: formatter.format(model.startIndication)),
              ),
              MyTextFieldCategory(
                labelText: healthJournal['labelText'].toString(),
                readOnly: false,
                textEditingController: TextEditingController(),
                onChanged: (value) {model.indication = value;},
              ),
              MyButtonCategory(myText: const Text('Добавить'), onPress: (){
                model.saveNewIndicationToHive();
              }),
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
                      itemCount: model.indications.length,
                      itemBuilder: (BuildContext context, int index) {
                        return MyTimeIntervalCategory(
                          count: model.indications.length,
                          titleText: '${model.indications[index].indications} ${healthJournal['gauge'].toString()}',
                          subtitleText: formatter.format(model.indications[index].data),
                          onPress: () {model.delIndication(model.indications[index].key);},
                        );
                      })),

            ],
          ),
        ),
      ),
    );
  }
}
