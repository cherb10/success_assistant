import 'package:flutter/material.dart';
import 'package:success_assistant/screens/home_screen.dart';
import 'package:success_assistant/screens/weekly_checkin_screen.dart';
import 'package:success_assistant/core/themes.dart';
import 'package:success_assistant/core/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const SuccessAssistantApp());
}

class SuccessAssistantApp extends StatelessWidget {
  const SuccessAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Success Assistant',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/weekly-checkin': (context) => const WeeklyCheckInScreen(),
      },
    );
  }
}