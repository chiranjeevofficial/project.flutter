import 'package:flutter/material.dart';
import 'package:testing_provider/pages/login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Namaste! Developer',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }),
                    (route) => false,
                  );
                },
                child: const Text('Welcome! Developer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
