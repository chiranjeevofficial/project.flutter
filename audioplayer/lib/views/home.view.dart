import 'package:audioplayer/extensions/custom.theme.extension.dart';
import 'package:audioplayer/views/album.view.dart';
import 'package:audioplayer/views/artist.view.dart';
import 'package:audioplayer/views/list.view.dart';
import 'package:audioplayer/views/song.view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Audo'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shuffle),
            ),
          ],
          bottom: TabBar(
            tabs: const [
              Tab(text: 'Lists'),
              Tab(text: 'Songs'),
              Tab(text: 'Artists'),
              Tab(text: 'Albums'),
            ],
            indicatorColor: context.theme.indicatorColor,
            labelColor: context.theme.labelColor,
            dividerHeight: 0,
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
        body: const TabBarView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            MyListView(),
            MySongView(),
            MyArtistView(),
            MyAlbumView(),
          ],
        ),
      ),
    );
  }
}
