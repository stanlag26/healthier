import 'package:flutter/material.dart';
import 'package:healthier/api/resource/resource.dart';

import '../../../api/main_navigation/main_navigation.dart';
import '../../../my_widgets/my_category_card.dart';

class HealthJournal extends StatelessWidget {
  const HealthJournal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            MyCategoryCard(
              name: 'Артериальное давление',
              indications: '120/80',
              upperlower: 'верхнее / нижнее',
              data: '12:00 23.05.2023',
              photo: Resource.arterialPressure,
              onPress: () {
                Navigator.pushNamed(context, MainNavigationRouteNames.categoryAddData);
              },
            ),
            MyCategoryCard(
              name: 'Вес',
              indications: '80 кг',
              data: '09:00 23.05.2023',
              photo: Resource.BodyWeight,
              onPress: () {Navigator.pushNamed(context, MainNavigationRouteNames.categoryAddData);},
            ),
            MyCategoryCard(
              name: 'Температура',
              indications: '36,6 °C' ,
              data: '10:00 23.05.2023',
              photo: Resource.BodyTemperature,
              onPress: () {Navigator.pushNamed(context, MainNavigationRouteNames.categoryAddData);},
            ),
            MyCategoryCard(
              name: 'Сахар в крови',
              indications: '4 м/моль',
              data: '14:00 23.05.2023',
              photo: Resource.BloodSugar,
              onPress: () {Navigator.pushNamed(context, MainNavigationRouteNames.categoryAddData);},
            ),
          ],
        ),
      ),
    );
  }
}
