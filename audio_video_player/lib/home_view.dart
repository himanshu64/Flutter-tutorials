import 'package:audio_video_player/audio_demo.dart';
import 'package:audio_video_player/video_demo.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video audio demo'),
      ),
      body: Center(
        child: SizedBox(
          height: 400.0,
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const AudioDemo()));
                  },
                  child: const Text('Navigate to audio demo')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const ChewieDemo()));
                  },
                  child: const Text('Navigate to video demo'))
            ],
          ),
        ),
      ),
    );
  }
}
