import 'package:flutter/material.dart';
import 'package:scouting2024/pages/home.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team 203 - Scouting 2024',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        fontFamily: 'SofiaSans',
        useMaterial3: true,
        brightness: Brightness.light
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        textTheme: Typography().white.apply(fontFamily: 'SofiaSans'),
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          color: Colors.red,
          iconTheme: IconThemeData(
            color: Colors.white70,
          ),
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)
        ),
      ),
      themeMode: ThemeMode.dark, 
      home: const HomePage(),
    );
  }
}
