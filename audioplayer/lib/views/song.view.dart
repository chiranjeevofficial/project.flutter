import 'package:audioplayer/extensions/custom.theme.extension.dart';
import 'package:audioplayer/models/songs.model.dart';
import 'package:flutter/material.dart';

class MySongView extends StatelessWidget {
  const MySongView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(songs[index]['title']!),
          subtitle: Text(songs[index]['singer']!),
          leading: const Icon(Icons.music_note),
        );
      },
    );
  }
}

class ListWithHeader extends StatelessWidget {
  const ListWithHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTabHeader(title: '50 Songs'),
          SongListView(),
        ],
      ),
    );
  }
}

class SongListView extends StatelessWidget {
  const SongListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(songs[index]['title']!),
            subtitle: Text(songs[index]['singer']!),
            leading: const Icon(Icons.music_note),
          );
        },
      ),
    );
  }
}

class MyTabHeader extends StatelessWidget {
  const MyTabHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white10,
      width: MediaQuery.of(context).size.width,
      height: 30,
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: context.theme.foregroundText,
        ),
      ),
    );
  }
}

class GenCenteredText extends StatelessWidget {
  const GenCenteredText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Tab 2 content',
        style: TextStyle(color: context.theme.foregroundText),
      ),
    );
  }
}
