

import 'package:flutter/material.dart';
import 'package:music1_app/screen/video/model/video_model.dart';

class VideoProvider with ChangeNotifier
{
  int index = 0;
  int sliderIndex =0;

  List<VideoModel> videoList = [

    VideoModel(imagePath: "",name: "",videoPath: ""),
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