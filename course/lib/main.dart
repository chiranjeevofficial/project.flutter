import 'package:course/pages/home.dart';
import 'package:course/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:course/pages/dashboard.dart';
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
      // theme: ThemeData(
      //   fontFamily: GoogleFonts.roboto().fontFamily,
      //   appBarTheme: const AppBarTheme(
      //     color: Colors.white,
      //     iconTheme: IconThemeData(color: Colors.purple),
      //   ),
      // ),
      debugShowCheckedModeBanner: false,
      initialRoute: NewRoute.dashboardRoute,
      routes: {
        "/" : (context) => const Home(),
        NewRoute.dashboardRoute : (context) => const Dashboard(),
        NewRoute.loginRoute : (context) => const Login(),
      },
    );
  }
}
