import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ui_state_provider.dart';

class DaySelector extends StatelessWidget {
  final List<String> days = [
    'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
  ];

  @override
  Widget build(BuildContext context) {
    final selectedDay = context.watch<SelectedDayProvider>().selectedDay;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: days.map((day) {
          final isSelected = selectedDay == day;
          return GestureDetector(
            onTap: () => context.read<SelectedDayProvider>().selectDay(day),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey[200],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                day,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}