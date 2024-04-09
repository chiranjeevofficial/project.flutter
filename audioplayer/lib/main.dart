import 'package:audioplayer/themes/dark.theme.dart';
import 'package:audioplayer/themes/light.theme.dart';
import 'package:audioplayer/views/home.view.dart';
import 'package:flutter/material.dart';

void main() async {
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: const HomeView(),
    );
  }
}
