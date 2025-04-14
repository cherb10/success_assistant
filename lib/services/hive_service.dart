import 'package:hive/hive.dart';
import '../models/weekly_checkin_model.dart';
import '../models/daily_focus.dart';

class HiveService {
  static const String weeklyCheckInBoxName = 'weeklyCheckIns';
  static const String dailyFocusBoxName = 'daily_focus';

  late final Box<WeeklyCheckInModel> _weeklyCheckInBox;
  late final Box<DailyFocus> _dailyFocusBox;

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(WeeklyCheckInModelAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(DailyFocusAdapter());
    }

    _weeklyCheckInBox = await Hive.openBox<WeeklyCheckInModel>(weeklyCheckInBoxName);
    _dailyFocusBox = await Hive.openBox<DailyFocus>(dailyFocusBoxName);
  }

  // Weekly Check-Ins
  Future<void> saveWeeklyCheckIn(WeeklyCheckInModel checkIn) async {
    await _weeklyCheckInBox.add(checkIn);
  }

  List<WeeklyCheckInModel> getAllCheckIns() {
    return _weeklyCheckInBox.values.toList();
  }

  WeeklyCheckInModel? getLatestCheckIn() {
    return _weeklyCheckInBox.isEmpty ? null : _weeklyCheckInBox.getAt(_weeklyCheckInBox.length - 1);
  }

  // Daily Focus
  Future<void> saveDailyFocus(DailyFocus focus) async {
    await _dailyFocusBox.put(focus.day, focus);
  }

  DailyFocus? getDailyFocus(String day) {
    return _dailyFocusBox.get(day);
  }
}