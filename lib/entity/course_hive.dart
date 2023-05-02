
import 'package:hive/hive.dart';

part 'course_hive.g.dart';

@HiveType(typeId: 1)
class CourseHive extends HiveObject {
  @HiveField(0)
  final String namePill;

  @HiveField(1)
  final String descriptionPill;

  @HiveField(2)
  String? photoPill;

  @HiveField(3)
  DateTime? startNamePill;

  @HiveField(4)
  DateTime? endNamePill;

  @HiveField(5)
  int periodicity;

  @HiveField(6)
  final List <String> timeOfReceipt;

  CourseHive( {
    required this.namePill,
    required this.descriptionPill,
    required this.photoPill,
    required this.timeOfReceipt,
    this.startNamePill,
    this.endNamePill,
    this.periodicity = 0,
  });
  @override
  String toString() => 'Название: $namePill, Описание: $descriptionPill, Фото: $photoPill, Прием: $timeOfReceipt, $startNamePill, $endNamePill, $periodicity' ;

}

//команда для генерации  flutter packages pub run build_runner watch
// flutter packages pub run build_runner build --delete-conflicting-outputs
