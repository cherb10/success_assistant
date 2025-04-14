import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Define routes here
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('Page not found'))));
    }
  }
}