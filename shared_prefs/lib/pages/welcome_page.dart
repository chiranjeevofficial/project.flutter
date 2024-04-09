import 'package:flutter/material.dart';
import 'package:shared_prefs/pages/home_page.dart';
import 'package:shared_prefs/pages/login_page.dart';
import 'package:shared_prefs/preferences/shared_prefs.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  void whereToGo() async {
    bool? isLoggedIn;
    isLoggedIn = await SharedPreferencesService.getBool(PrefKey.isLoggedIn);
    if (isLoggedIn != null && isLoggedIn == true) {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) {
          return const HomePage();
        }),
      );
    } else {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) {
          return const LoginPage();
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.purple,
              Colors.black,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Namaste! Coder',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: whereToGo,
              child: const Icon(
                Icons.arrow_circle_right_rounded,
                size: 50,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
