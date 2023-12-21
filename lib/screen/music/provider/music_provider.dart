import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music1_app/screen/music/model/music_model.dart';

class MusicProvider with ChangeNotifier {
  AssetsAudioPlayer player = AssetsAudioPlayer();
  bool isPlay = false;
  Duration totalDuration = const Duration(seconds: 0);
  int index = 0;
  int sliderIndex = 0;

  List<MusicModel> musicList = [
    MusicModel(
        name: "Chaleya", imagePath: "Chaleya.jpeg", musicName: "assets/music/music1.mp3"),
    MusicModel(
        name: "Heeriye", imagePath: "Heeriye.jpeg", musicName: "assets/music/music2.mp3"),
    MusicModel(
        name: "Kesariya", imagePath: "Kesariya1.jpeg", musicName: "assets/music/music3.mp3"),
    MusicModel(
        name: "Tum Kya Mile",
        imagePath: "Tum Kya Mile1.jpeg",
        musicName: "assets/music/music4.mp3"),
    MusicModel(
        name: "Satranga", imagePath: "Satranga1.jpeg", musicName: "assets/music/music5.mp3"),
  ];

  void changIndex(int i) {
    index = i;
    notifyListeners();
  }

  void changTotalDuration(Duration d1) {
    totalDuration = d1;
    notifyListeners();
  }

  void changeStatus(bool status) {
    isPlay = status;
    notifyListeners();
  }

  void changeIndexSlider(int i) {
    sliderIndex = i;
    notifyListeners();
  }
}
