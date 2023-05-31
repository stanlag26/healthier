import 'package:flutter/material.dart';
import 'package:healthier/api/resource/resource.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../api/main_navigation/main_navigation.dart';
import '../../../my_widgets/my_category_card.dart';
import 'health_journal_model.dart';

class HealthJournalProviderWidget extends StatelessWidget {
  const HealthJournalProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: HealthJournalDataModel(), child: HealthJournal());
  }
}

class HealthJournal extends StatelessWidget {
  const HealthJournal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HealthJournalDataModel>();
    final DateFormat formatter = DateFormat('HH:mm, dd.MM.yyyy');
    final List<Map<String, String>> healthJournal = [
      {
        'id': '0',
        'name': 'Артериальное давление',
        'indications': model.bodyPressure?.indications ?? 'Нет данных',
        'upperlower': 'верхнее / нижнее',
        'gauge': '',
        'labelText': 'Ведите давление (120/80)',
        'data': model.bodyPressure?.data != null
            ? formatter.format(model.bodyPressure!.data)
            : '',
        'photo': Resource.arterialPressure,
      },
      {
        'id': '1',
        'name': 'Вес',
        'indications': model.bodyWeight?.indications != null
            ? '${model.bodyWeight!.indications} кг': 'Нет данных',
        'gauge': 'кг',
        'labelText': 'Ведите ваш вес',
        'data': model.bodyWeight?.data != null
            ? formatter.format(model.bodyWeight!.data)
            : '',
        'photo': Resource.BodyWeight,
      },
      {
        'id': '2',
        'name': 'Температура',
        'indications': model.bodyTemperature?.indications != null
            ? '${model.bodyTemperature!.indications} °C'
            : 'Нет данных',
        'gauge': '°C',
        'labelText': 'Ведите вашу температуру тела',
        'data': model.bodyTemperature?.data != null
            ? formatter.format(model.bodyTemperature!.data)
            : '',
        'photo': Resource.BodyTemperature,
      },
      {
        'id': '3',
        'name': 'Сахар в крови',
        'indications': model.bloodSugar?.indications != null
            ? '${model.bloodSugar!.indications} м/моль'
            : 'Нет данных',
        'gauge': 'м/моль',
        'labelText': 'Ведите параметры сахара',
        'data': model.bloodSugar?.data != null
            ? formatter.format(model.bloodSugar!.data)
            : '',
        'photo': Resource.BloodSugar,
      },
    ];

    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: healthJournal.length,
            itemBuilder: (BuildContext context, int index) {
              return MyCategoryCard(
                  name: healthJournal[index]['name'].toString(),
                  indications: healthJournal[index]['indications'].toString(),
                  upperlower: healthJournal[index]['upperlower'].toString(),
                  data: healthJournal[index]['data'].toString(),
                  photo: healthJournal[index]['photo'].toString(),
                  onPress: () {
                    Navigator.pushNamed(
                      context,
                      MainNavigationRouteNames.categoryAddData,
                      arguments: healthJournal[index],
                    );
                  });
            }),
      ),
    );
  }
}
