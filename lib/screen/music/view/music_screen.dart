import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music1_app/screen/music/provider/music_provider.dart';
import 'package:music1_app/utils/colors.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  double height = 0;
  double width = 0;
  MusicProvider? providerR;
  MusicProvider? providerW;
  PageController pageController = PageController();
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    providerR = context.read<MusicProvider>();
    providerW = context.watch<MusicProvider>();
    height = MediaQuery.sizeOf(context).height * 0.27;
    width = MediaQuery.sizeOf(context).width * 0.55;
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider.builder(
              carouselController: carouselController,
              itemCount: 5,
              itemBuilder: (context, index, realIndex) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black26, width: 4)),
                  child: InkWell(
                    onTap: () {
                      providerR!.changIndex(index);
                      Navigator.pushNamed(context, 'musicPlay');
                    },
                    child: Image.asset(
                      "assets/image/${providerW!.musicList[index].imagePath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  providerW!.changeIndexSlider(index);
                },
                initialPage: providerR!.sliderIndex,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlay: true,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                animateToClosest: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => containerTile(index),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
            itemCount: providerR!.musicList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    providerR!.changIndex(index);
                    Navigator.pushNamed(context, 'musicPlay');
                  },
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: white,
                      border: Border.all(
                        color: Colors.black26,
                        width: 4,
                      ),
                    ),
                    child: Image.asset(
                      "assets/image/${providerR!.musicList[index].imagePath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container containerTile(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == providerW!.sliderIndex ? Colors.blueGrey : white),
    );
  }
}
