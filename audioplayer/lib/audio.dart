import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const AudioPlayerApp());
}

class AudioPlayerApp extends StatelessWidget {
  const AudioPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Audio Player Demo',
      home: AudioPlayerPage(),
    );
  }
}

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  AudioPlayerPageState createState() => AudioPlayerPageState();
}

class AudioPlayerPageState extends State<AudioPlayerPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  String audioPath = 'assets/audios/audio.mp3';

  @override
  void initState() {
    super.initState();
  }

  void loadAudio() async {
    audioPlayer = AudioPlayer();
    // audioPlayer.setUrl(audioPath);
    await audioPlayer.setSource(AssetSource(audioPath));
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.play_arrow),
              iconSize: 48,
              onPressed: () async {
                await audioPlayer.play(AssetSource(audioPath));
              },
            ),
            const SizedBox(height: 20),
            IconButton(
              icon: const Icon(Icons.pause),
              iconSize: 48,
              onPressed: () {
                // Pause the audio
                audioPlayer.pause();
              },
            ),
            const SizedBox(height: 20),
            IconButton(
              icon: const Icon(Icons.stop),
              iconSize: 48,
              onPressed: () {
                // Stop the audio
                audioPlayer.stop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
