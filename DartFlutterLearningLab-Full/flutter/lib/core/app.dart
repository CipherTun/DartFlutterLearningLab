import 'package:flutter/material.dart';
import '../features/home/home_screen.dart';
class LearningLabApp extends StatelessWidget {
  const LearningLabApp({super.key});
  @override Widget build(BuildContext context) => MaterialApp(
    title: 'Dart + Flutter Learning Lab', debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB7C9FF), brightness: Brightness.dark)),
    home: const HomeScreen(),
  );
}
