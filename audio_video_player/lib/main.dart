import 'package:audio_video_player/common/theme.dart';
import 'package:audio_video_player/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeView()));
}
