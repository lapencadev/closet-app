import 'package:flutter/material.dart';
import 'package:mobile/screens/home_screen.dart';
import 'package:mobile/utils/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Closet',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MyHomePage(title: 'My Closet'),
    );
  }
}
