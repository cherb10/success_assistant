import 'package:hive/hive.dart';

part 'weekly_checkin_model.g.dart';

@HiveType(typeId: 0)
class WeeklyCheckInModel extends HiveObject {
  @HiveField(0)
  final String reflection;

  @HiveField(1)
  final String theme;

  @HiveField(2)
  final double focusScore;

  @HiveField(3)
  final String intentions;

  @HiveField(4)
  final DateTime createdAt;

  WeeklyCheckInModel({
    required this.reflection,
    required this.theme,
    required this.focusScore,
    required this.intentions,
    required this.createdAt,
  });
}