import 'package:audioplayer/extensions/custom.theme.extension.dart';
import 'package:flutter/material.dart';

class MyArtistView extends StatelessWidget {
  const MyArtistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tab 3 content',
        style: TextStyle(color: context.theme.foregroundText),
      ),
    );
  }
}
