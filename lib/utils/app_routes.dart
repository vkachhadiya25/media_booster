import 'package:flutter/cupertino.dart';
import 'package:music1_app/screen/home/view/home_screen.dart';
import 'package:music1_app/screen/music/view/music_play_screen.dart';
import 'package:music1_app/screen/video/view/video_play_screen.dart';

Map<String,WidgetBuilder> screenRoutes =
{
  '/' : (context) => const HomeScreen(),
  'musicPlay' : (context) => const MusicPlayScreen(),
  'videoPlay' : (context) => const VideoPlayScreen(),
};