import 'package:audioplayer/extensions/custom.theme.extension.dart';
import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tab 1 content',
        style: TextStyle(color: context.theme.foregroundText),
      ),
    );
  }
}
