import 'package:hive/hive.dart';

part 'daily_focus.g.dart';

@HiveType(typeId: 1)
class DailyFocus extends HiveObject {
  @HiveField(0)
  final String day;

  @HiveField(1)
  final String focus;

  DailyFocus({
    required this.day,
    required this.focus,
  });
}