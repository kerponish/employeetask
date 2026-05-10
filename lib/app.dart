import 'package:flutter/material.dart';
import 'package:taskk/view/dashboard_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee and image grid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 150, 187, 174),
        ),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
