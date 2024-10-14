import 'package:flutter/material.dart';
import 'package:weather_reports/dashboard/ui/dashboard_ui.dart';
import 'package:weather_reports/di/service_locator.dart';

void main() {
  setupServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DashboardUi(),
    );
  }
}
