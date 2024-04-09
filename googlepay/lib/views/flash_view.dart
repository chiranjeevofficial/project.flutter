import 'package:flutter/material.dart';

class FlashView extends StatelessWidget {
  const FlashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Google')
          ],
        ),
      ),
    );
  }
}
