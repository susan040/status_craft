import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/views/splash_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mads Cleaning",
      theme: ThemeData(useMaterial3: false),
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
