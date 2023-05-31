import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../entity/health_monitoring.dart';

class HealthJournalDataModel extends ChangeNotifier {
  HealthMonitoringHive? bodyPressure;
  HealthMonitoringHive? bodyWeight;
  HealthMonitoringHive? bodyTemperature;
  HealthMonitoringHive? bloodSugar;

  HealthJournalDataModel() {
    _setup();
  }

  Future<void> _setup() async {
    final box = await Hive.openBox<HealthMonitoringHive>('healthMonitoring_box');
    var bodyPressureList = box.values.where((item) => item.id == 0).toList();
    var bodyWeightList = box.values.where((item) => item.id == 1).toList();
    var bodyTemperatureList = box.values.where((item) => item.id == 2).toList();
    var bloodSugarList = box.values.where((item) => item.id == 3).toList();

    if (bodyPressureList.isNotEmpty) {
      bodyPressure = bodyPressureList.last;
    }
    if (bodyWeightList.isNotEmpty) {
      bodyWeight = bodyWeightList.last;
    }
    if (bodyTemperatureList.isNotEmpty) {
      bodyTemperature = bodyTemperatureList.last;
    }
    if (bloodSugarList.isNotEmpty) {
      bloodSugar = bloodSugarList.last;
    }

    box.listenable().addListener(() => _readIndicationFromHive());
    notifyListeners();
  }

  Future<void> _readIndicationFromHive() async {
    final box = await Hive.openBox<HealthMonitoringHive>('healthMonitoring_box');
    var bodyPressureList = box.values.where((item) => item.id == 0).toList();
    var bodyWeightList = box.values.where((item) => item.id == 1).toList();
    var bodyTemperatureList = box.values.where((item) => item.id == 2).toList();
    var bloodSugarList = box.values.where((item) => item.id == 3).toList();

    if (bodyPressureList.isNotEmpty) {
      bodyPressure = bodyPressureList.last;
    }
    if (bodyWeightList.isNotEmpty) {
      bodyWeight = bodyWeightList.last;
    }
    if (bodyTemperatureList.isNotEmpty) {
      bodyTemperature = bodyTemperatureList.last;
    }
    if (bloodSugarList.isNotEmpty) {
      bloodSugar = bloodSugarList.last;
    }

    notifyListeners();
  }
}
