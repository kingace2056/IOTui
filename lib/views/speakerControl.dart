// ignore_for_file: file_names

import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:battery_indicator/battery_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

double sliderValue = 30;
double songTime = 20;
bool ispaused = false;
bool powered = true;

class SpeakerControl extends StatefulWidget {
  const SpeakerControl({
    Key? key,
  }) : super(key: key);

  @override
  State<SpeakerControl> createState() => _SpeakerControlState();
}

class _SpeakerControlState extends State<SpeakerControl> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool devStatus =
        (ModalRoute.of(context)?.settings.arguments ?? bool) as bool;
    // powered = devStatus;
    log('${devStatus}this is dev statys ');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Speaker'),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert_sharp)],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    colorFilter:
                        powered ? null : const ColorFilter.linearToSrgbGamma(),
                    image: const NetworkImage(
                        'https://www.audicoonline.co.za/image/cache/catalog/B%20and%20O/bang-olufsen-beolab-19-wireless-subwooferbeolab-19-3992-500x500.png'),
                  ))),
              Positioned(
                // top: 0,
                bottom: 30,
                right: MediaQuery.of(context).size.width / 7,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: powered ? Colors.green : Colors.red[800],
                      borderRadius: BorderRadius.circular(70)),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          powered ? powered = false : powered = true;
                          ispaused = true;
                        });
                      },
                      icon: Icon(
                        Icons.power_settings_new_sharp,
                        color: Colors.white,
                        size: 50,
                      )),
                ),
              )
            ]),
            Flexible(
              child: Row(
                children: [
                  utilityWidget(
                    utilityIcon: Icons.airplay_rounded,
                    utilityName: 'AirPlay',
                  ),
                  utilityWidget(
                    utilityIcon: Icons.equalizer_rounded,
                    utilityName: 'EQ',
                  ),
                  utilityWidget(
                    utilityIcon: Icons.link_sharp,
                    utilityName: 'Add to Pair',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            mediaPlayerWidget(context)
          ],
        ),
      ),
    );
  }

  Flexible mediaPlayerWidget(BuildContext context) {
    return Flexible(
        child: Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      padding: const EdgeInsets.all(20),
      // height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.speaker,
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Now Playing',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                      ),
                      SizedBox(
                        child: BatteryIndicator(
                          // showPercentNum: true,
                          colorful: true,
                          size: 15,
                          showPercentSlide: true,
                          style: BatteryIndicatorStyle.skeumorphism,
                        ),
                      ),
                    ],
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Marquee(
                        scrollAxis: Axis.horizontal,
                        text: 'The song from my fav playlist',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 187, 187, 187),
                            fontWeight: FontWeight.w600),
                        blankSpace: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SliderTheme(
            child: Slider(
              value: songTime,
              min: 0,
              max: 100,
              activeColor: Colors.white,
              onChanged: ((value) {
                setState(() {
                  songTime = value;
                  log(songTime.toString());
                });
              }),
            ),
            data: SliderTheme.of(context)
                .copyWith(thumbShape: SliderComponentShape.noThumb),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_previous_rounded,
                    color: Colors.white,
                    size: 50,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      ispaused ? ispaused = false : ispaused = true;
                    });
                  },
                  icon: Icon(
                    ispaused ? Icons.play_arrow_rounded : Icons.pause,
                    color: Colors.white,
                    size: 50,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_next_rounded,
                    color: Colors.white,
                    size: 50,
                  )),
            ],
          )
        ],
      ),
    ));
  }
}

class utilityWidget extends StatelessWidget {
  IconData utilityIcon;
  String utilityName;

  utilityWidget({
    Key? key,
    required this.utilityIcon,
    required this.utilityName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          // height: MediaQuery.of(context).size.height * 0.12,
          padding: EdgeInsets.fromLTRB(8, 20, 8, 20),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(20)),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                utilityIcon,
                color: Colors.white,
                size: 30,
              ),
              Wrap(children: [
                Text(
                  utilityName,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
