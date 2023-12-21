import 'package:flutter/material.dart';
import 'package:music1_app/screen/home/provider/home_provider.dart';
import 'package:music1_app/screen/music/provider/music_provider.dart';
import 'package:music1_app/screen/video/provider/video_provider.dart';
import 'package:music1_app/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ChangeNotifierProvider(create: (context) => MusicProvider(),),
      ChangeNotifierProvider(create: (context) => VideoProvider(),),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: screenRoutes,
    ),
  ));
}
