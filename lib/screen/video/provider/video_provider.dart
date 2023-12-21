

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:music1_app/screen/video/model/video_model.dart';
import 'package:video_player/video_player.dart';

class VideoProvider with ChangeNotifier
{
  int index = 0;
  int sliderIndex =0;
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  List<VideoModel> videoList = [

    VideoModel(imagePath: "Chaleya.jpeg",name: "Chaleya",videoPath: "music1.mp4"),
    VideoModel(imagePath: "Heeriye.jpeg",name: "Heeriye",videoPath: "music2.mp4"),
    VideoModel(imagePath: "Kesariya1.jpeg",name: "Kesariya",videoPath: "music3.mp4"),
    VideoModel(imagePath: "Satranga1.jpeg",name: "Satranga",videoPath: "music4.mp4"),
    VideoModel(imagePath: "Tum Kya Mile1.jpeg",name: "Tum Kya Mile",videoPath: "music5.mp4"),
  ];
  void changIndex(int i) {
    index = i;
    notifyListeners();
  }

  void changeIndexSlider(int i) {
    sliderIndex = i;
    notifyListeners();
  }
}