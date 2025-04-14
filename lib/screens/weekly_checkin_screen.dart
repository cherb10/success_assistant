import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:success_assistant/core/locator.dart';
import 'package:success_assistant/models/weekly_checkin_model.dart';
import 'package:success_assistant/services/hive_service.dart';

class WeeklyCheckInScreen extends StatefulWidget {
  const WeeklyCheckInScreen({super.key});

  @override
  State<WeeklyCheckInScreen> createState() => _WeeklyCheckInScreenState();
}

class _WeeklyCheckInScreenState extends State<WeeklyCheckInScreen> {
  final TextEditingController _reflectionController = TextEditingController();
  final TextEditingController _intentionsController = TextEditingController();
  double _focusScore = 5;
  String _selectedTheme = 'Discipline';

  WeeklyCheckInModel? _latestCheckIn;

  final List<String> _themeOptions = [
    'Discipline',
    'Faith',
    'Creativity',
    'Gratitude',
    'Patience',
  ];

  @override
  void initState() {
    super.initState();
    _loadLatestCheckIn();
  }

  void _loadLatestCheckIn() {
    final latest = locator<HiveService>().getLatestCheckIn();
    setState(() {
      _latestCheckIn = latest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Check-In'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_latestCheckIn != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Last Check-In',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Card(
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 24),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date: ${DateFormat.yMMMd().format(_latestCheckIn!.createdAt)}",
                          ),
                          Text("Theme: ${_latestCheckIn!.theme}"),
                          Text(
                            "Focus Score: ${_latestCheckIn!.focusScore.toStringAsFixed(1)}",
                          ),
                          const SizedBox(height: 4),
                          Text("Reflection: ${_latestCheckIn!.reflection}"),
                          const SizedBox(height: 4),
                          Text("Intentions: ${_latestCheckIn!.intentions}"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            const Text('Reflection on Last Week'),
            TextField(
              controller: _reflectionController,
              maxLines: 3,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            const Text('Theme for This Week'),
            DropdownButtonFormField<String>(
              value: _selectedTheme,
              items: _themeOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedTheme = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text('Focus Score'),
            Slider(
              value: _focusScore,
              min: 1,
              max: 10,
              divisions: 9,
              label: _focusScore.round().toString(),
              onChanged: (value) {
                setState(() {
                  _focusScore = value;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text('Intentions for This Week'),
            TextField(
              controller: _intentionsController,
              maxLines: 2,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _saveCheckIn,
                child: const Text('Save Check-In'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveCheckIn() {
    final reflection = _reflectionController.text;
    final intentions = _intentionsController.text;

    final checkIn = WeeklyCheckInModel(
      reflection: reflection,
      theme: _selectedTheme,
      focusScore: _focusScore,
      intentions: intentions,
      createdAt: DateTime.now(),
    );

    locator<HiveService>().saveWeeklyCheckIn(checkIn);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Check-in saved!')),
    );

    _reflectionController.clear();
    _intentionsController.clear();
    setState(() {
      _focusScore = 5;
      _selectedTheme = 'Discipline';
    });

    _loadLatestCheckIn();
  }

  @override
  void dispose() {
    _reflectionController.dispose();
    _intentionsController.dispose();
    super.dispose();
  }
}