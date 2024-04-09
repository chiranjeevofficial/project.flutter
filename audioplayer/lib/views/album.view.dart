import 'package:audioplayer/extensions/custom.theme.extension.dart';
import 'package:flutter/material.dart';

class MyAlbumView extends StatelessWidget {
  const MyAlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tab 4 content',
        style: TextStyle(color: context.theme.foregroundText),
      ),
    );
  }
}
