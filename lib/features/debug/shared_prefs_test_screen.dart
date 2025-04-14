import 'package:flutter/material.dart';
import 'package:success_assistant/core/locator.dart';
import 'package:success_assistant/core/services/shared_preferences_service.dart';

class SharedPrefsTestScreen extends StatefulWidget {
  const SharedPrefsTestScreen({super.key});

  @override
  State<SharedPrefsTestScreen> createState() => _SharedPrefsTestScreenState();
}

class _SharedPrefsTestScreenState extends State<SharedPrefsTestScreen> {
  late SharedPreferencesService _prefsService;
  bool _onboardingComplete = false;

  @override
  void initState() {
    super.initState();
    _prefsService = getIt<SharedPreferencesService>();
    _loadPrefs();
  }

  Future<void> _loadPrefs() async {
    final result = _prefsService.isOnboardingComplete;
    setState(() => _onboardingComplete = result);
  }

  Future<void> _markComplete() async {
    await _prefsService.setOnboardingComplete(true);
    _loadPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shared Prefs Test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Onboarding Complete: \$_onboardingComplete'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _markComplete,
              child: const Text('Mark Onboarding Complete'),
            ),
          ],
        ),
      ),
    );
  }
}