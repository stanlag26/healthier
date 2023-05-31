import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../../../api/hive_api/hive_api.dart';
import '../../../entity/health_monitoring.dart';

class HealthJournalAddDataModel extends ChangeNotifier {
  late int index;
  late String indication;
  DateTime startIndication = DateTime.now();
  List<HealthMonitoringHive> _indications = [];
  late Box<HealthMonitoringHive> _box;
  List<HealthMonitoringHive> get indications => _indications;

  HealthJournalAddDataModel() {
    _setup();
  }

  Future<void> _setup() async {
    _box = await Hive.openBox<HealthMonitoringHive>('healthMonitoring_box');
    _indications = _box.values.where((item) => item.id == index).toList();
    _box.listenable().addListener(() => _readIndicationFromHive());
    notifyListeners();
  }

  Future<void> _readIndicationFromHive() async {
    _indications = _box.values.where((item) => item.id == index).toList();
    notifyListeners();
  }

  void delIndication(int key) {
  // _box.clear();
      _box.delete(key);
      print(key);



  }



  Future<void> selectStartIndication(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: startIndication,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != startIndication) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(startIndication),
      );

      if (pickedTime != null) {
        final DateTime pickedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        startIndication = pickedDateTime;
        notifyListeners();
      }
    }
  }

  Future<void> saveNewIndicationToHive() async {
    saveIndicationToHive(index, indication, startIndication);
  }
}
