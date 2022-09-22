// ignore_for_file: file_names
import 'dart:developer';
import 'package:battery_indicator/battery_indicator.dart';
import 'package:flutter/material.dart';
import 'package:iot_ui/views/sound/equalizer.dart';
import 'package:marquee/marquee.dart';

import 'package:iot_ui/constraints/constraints.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  double sliderValue = 0;

  void saveStates() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('Smart\nSpeaker', powered);
  }

  void getStates() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      powered = pref.getBool('Smart\nSpeaker') == null
          ? false
          : pref.getBool('Smart\nSpeaker') as bool;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getStates();
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
        // backgroundColor: spkGradEnd,
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
                          colorFilter: powered
                              ? null
                              : const ColorFilter.linearToSrgbGamma(),
                          image: const AssetImage('assets/images/bof.png')))),
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
                        saveStates();
                        setState(() {
                          powered ? powered = false : powered = true;
                          ispaused = true;
                        });
                      },
                      icon: const Icon(
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
        gradient: LinearGradient(colors: [spkGradStart, spkGradEnd]),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            // blurStyle: BlurStyle.inner,
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
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
                      const Text(
                        'Now Playing',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4.5,
                      ),
                      Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 30,
                              spreadRadius: 2)
                        ]),
                        child: BatteryIndicator(
                          showPercentNum: false,
                          colorful: true,
                          size: 15,
                          showPercentSlide: true,
                          style: BatteryIndicatorStyle.skeumorphism,
                          batteryLevel: 50,
                          batteryFromPhone: false,
                          ratio: 6 / 3,
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
                        velocity: 30,
                        text: 'Rick Astley - Never Gonna Give You Up',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 220, 220, 220),
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
            data: SliderTheme.of(context).copyWith(
                trackHeight: 3,
                activeTrackColor: Colors.white,
                thumbShape: SliderComponentShape.noThumb),
            child: Slider(
              value: songTime,
              min: 0,
              max: 100,
              activeColor: Colors.white,
              inactiveColor: const Color.fromARGB(255, 197, 197, 197),
              onChanged: ((value) {
                setState(() {
                  songTime = value;
                  log(songTime.toString());
                });
              }),
            ),
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
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  alignment: Alignment.center,
                  contentPadding: EdgeInsets.all(4),
                  backgroundColor: Colors.grey,
                  content: Equalizer(),
                );
              });
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          // height: MediaQuery.of(context).size.height * 0.12,
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [spkGradStart, spkGradEnd]),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  // blurStyle: BlurStyle.inner,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(20)),
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
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
