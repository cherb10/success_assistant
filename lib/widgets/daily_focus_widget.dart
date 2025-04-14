import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:success_assistant/core/locator.dart';
import 'package:success_assistant/models/daily_focus.dart';
import 'package:success_assistant/providers/ui_state_provider.dart';
import 'package:success_assistant/services/hive_service.dart';

class DailyFocusWidget extends StatefulWidget {
  const DailyFocusWidget({Key? key}) : super(key: key);

  @override
  _DailyFocusWidgetState createState() => _DailyFocusWidgetState();
}

class _DailyFocusWidgetState extends State<DailyFocusWidget> {
  late TextEditingController _controller;
  String _currentDay = '';
  final HiveService _hiveService = locator<HiveService>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadFocus();
  }

  void _loadFocus() {
    final selectedDay = context.read<SelectedDayProvider>().selectedDay;
    _currentDay = selectedDay;
    final focusEntry = _hiveService.getDailyFocus(_currentDay);
    _controller.text = focusEntry?.focus ?? '';
  }

  void _saveFocus(String value) {
    final focus = DailyFocus(day: _currentDay, focus: value);
    _hiveService.saveDailyFocus(focus);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Today\'s Focus',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _controller,
            onChanged: _saveFocus,
            decoration: const InputDecoration(
              hintText: 'Enter your main focus for the day...',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}