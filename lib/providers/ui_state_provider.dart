import 'package:flutter/material.dart';

class SelectedDayProvider extends ChangeNotifier {
  String _selectedDay = 'Monday';

  String get selectedDay => _selectedDay;

  void selectDay(String day) {
    _selectedDay = day;
    notifyListeners();
  }
}