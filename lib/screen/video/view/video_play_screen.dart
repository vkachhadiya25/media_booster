import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:music1_app/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../utils/colors.dart';

class VideoPlayScreen extends StatefulWidget {
  const VideoPlayScreen({super.key});

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<VideoProvider>().videoPlayerController =
        VideoPlayerController.asset(
            "${context.read<VideoProvider>().videoList[context.read<VideoProvider>().index].videoPath}")
          ..initialize().then((value) {
            setState(() {});
          });
    context.read<VideoProvider>().chewieController = ChewieController(
        videoPlayerController:
            context.read<VideoProvider>().videoPlayerController!);
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: white),
          title: Text(
            "Video Play",
            style: TextStyle(fontSize: 22, color: white),
          ),
          backgroundColor: black,
        ),
        body: Center(
          child: SizedBox(
              height: 200,
              child: Chewie(
                controller: providerR!.chewieController!,
              )),
        ),
      ),
    );
  }
}
