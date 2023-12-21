import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music1_app/utils/colors.dart';
import 'package:provider/provider.dart';

import '../provider/music_provider.dart';

class MusicPlayScreen extends StatefulWidget {
  const MusicPlayScreen({super.key});

  @override
  State<MusicPlayScreen> createState() => _MusicPlayScreenState();
}

class _MusicPlayScreenState extends State<MusicPlayScreen> {
  MusicProvider? providerR;
  MusicProvider? providerW;
  double height = 0;
  double width = 0;

  @override
  void initState() {
    super.initState();
    loadSong();
  }

  void loadSong() {
    context.read<MusicProvider>().player.open(
        Audio(
            "${context.read<MusicProvider>().musicList[context.read<MusicProvider>().index].musicName}"),
        autoStart: context.read<MusicProvider>().isPlay,
        showNotification: true);
    context.read<MusicProvider>().player.current.listen((event) {
      Duration d1 = event!.audio.duration;
      context.read<MusicProvider>().changTotalDuration(d1);
    });
    liveDuration();
  }

  void liveDuration() {
    context.read<MusicProvider>().player.currentPosition.listen((event) {
      if (context.read<MusicProvider>().player.stopped) {
        context.read<MusicProvider>().changeStatus(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<MusicProvider>();
    providerW = context.watch<MusicProvider>();
    height = MediaQuery.sizeOf(context).height * 0.50;
    width = MediaQuery.sizeOf(context).width * 0.95;
    return PopScope(
      onPopInvoked: (didPop){
        context.read<MusicProvider>().player.pause();
        context.read<MusicProvider>().isPlay = false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: white),
            title: Text(
              "Music Play",
              style: TextStyle(fontSize: 22, color: white),
            ),
            backgroundColor: black,
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black26,width: 3),

                    ),
                    child: Image.asset(
                      "assets/image/${providerR!.musicList[providerR!.index].imagePath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "${providerW!.musicList[providerW!.index].name}",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.grey.shade50,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (providerR!.index > 0) {
                              providerR!.changIndex(--providerR!.index);
                            }
                            loadSong();
                          },
                          icon: Icon(
                            Icons.navigate_before_rounded,
                            color: Colors.grey.shade50,
                            size: 40,
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        IconButton(
                          onPressed: () {
                            if (providerR!.isPlay == false) {
                              context.read<MusicProvider>().player.play();
                              providerR!.changeStatus(true);
                            } else {
                              context.read<MusicProvider>().player.pause();
                              providerR!.changeStatus(false);
                            }
                          },
                          icon: Icon(
                            providerW!.isPlay ? Icons.pause : Icons.play_circle,
                            color: Colors.grey.shade50,
                            size: 40,
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        IconButton(
                          onPressed: () {
                            if (providerR!.index <
                                providerR!.musicList.length - 1) {
                              providerR!.changIndex(++providerR!.index);
                            }
                            loadSong();
                          },
                          icon: Icon(
                            Icons.navigate_next,
                            color: Colors.grey.shade50,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    PlayerBuilder.currentPosition(
                      player: context.read<MusicProvider>().player,
                      builder: (context, position) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Slider(
                              min: 0,
                              value: position.inSeconds.toDouble(),
                              max: providerR!.totalDuration.inSeconds.toDouble(),
                              activeColor: green,
                              onChanged: (value) {
                                context
                                    .read<MusicProvider>()
                                    .player
                                    .seek(Duration(
                                      seconds: value.toInt(),
                                    ));
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text(
                                    "${position.toString().split(".")[0]}",
                                    style: TextStyle(color: Colors.grey.shade50, fontSize: 20),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${providerW!.totalDuration.toString().split(".")[0]}",
                                    style: TextStyle(color: Colors.grey.shade50, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: Colors.black26,
        ),
      ),
    );
  }
}
