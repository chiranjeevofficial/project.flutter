import 'package:course/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:course/pages/home.dart';
import 'package:course/pages/login.dart';
import 'package:course/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: NewTheme.lightTheme(context),
      darkTheme: NewTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: NewRoute.homeRoute,
      routes: {
        "/" : (context) => const Home(),
        NewRoute.homeRoute : (context) => const Home(),
        NewRoute.loginRoute : (context) => const Login(),
      },
    );
  }
}
