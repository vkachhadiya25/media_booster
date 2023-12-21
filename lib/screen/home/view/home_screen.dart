import 'package:flutter/material.dart';
import 'package:music1_app/screen/home/provider/home_provider.dart';
import 'package:music1_app/screen/music/view/music_screen.dart';
import 'package:music1_app/screen/video/view/video_screen.dart';
import 'package:music1_app/utils/colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    List<Widget> screen = [
      const MusicScreen(),
      const VideoScreen(),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Music & Video Player",
            style: TextStyle(fontSize: 22, color: white),
          ),
          backgroundColor: green,
        ),
        body: screen[providerW!.index],
        backgroundColor: black,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note_outlined,size: 30,),
              label: 'Music',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined,size: 30,),
              label: 'Video',
            ),
          ],
          currentIndex : providerR!.index,
          selectedItemColor: white,
          onTap: (value) {
            int i = value;
            providerR!.changeIndex(i);
          },
          backgroundColor: green,
        ),
      ),
    );
  }
}
