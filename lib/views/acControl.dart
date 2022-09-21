import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

bool switchValue = true;
double sliderValue = 18.0;
int speed = 1;
// final List<Color> _bodyColors = [
//   const Color.fromARGB(255, 16, 52, 166),
//   const Color.fromARGB(255, 65, 47, 136),
//   const Color.fromARGB(255, 114, 43, 106),
//   const Color.fromARGB(255, 162, 38, 75),
//   const Color(0xFFD3212D),
//   const Color(0xFFF62D2D),
// ];

final List<Color> _bodyColors = [
  Colors.cyan,
  Colors.lightBlue,
  Colors.blue,
  Colors.indigo,
  Colors.deepPurple,
  Colors.purple,
  Colors.pink,
  Colors.red,
];

Color activeColor = _bodyColors[1];

class AcControl extends StatefulWidget {
  const AcControl({Key? key}) : super(key: key);

  @override
  State<AcControl> createState() => _AcControlState();
}

class _AcControlState extends State<AcControl> {
  @override
  void initState() {
    switchValue = true;
    speed = 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart AC'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buttons(Icons.sunny, 16.0),
                  buttons(Icons.water_drop_outlined, 18.0),
                  buttons(FontAwesome.cloud, 20.0),
                  buttons(Icons.ac_unit, 30.0),
                ],
              ),
            ),
            sliderWidget(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: activeColor),
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Speed',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
                      child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white
                                                .withOpacity(0.3),
                                            offset: const Offset(0, 1),
                                            blurRadius: 10,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(20),
                                        color: speed == 1
                                            ? Colors.white
                                            : activeColor),
                                    child: Text(
                                      '1',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: speed == 1
                                              ? Colors.black
                                              : Colors.white),
                                    )),
                                onTap: () {
                                  setState(() {
                                    speed = 1;
                                  });
                                }),
                            InkWell(
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white
                                                .withOpacity(0.3),
                                            offset: const Offset(0, 1),
                                            blurRadius: 10,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(20),
                                        color: speed == 2
                                            ? Colors.white
                                            : activeColor),
                                    child: Text(
                                      '2',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: speed == 2
                                              ? Colors.black
                                              : Colors.white),
                                    )),
                                onTap: () {
                                  setState(() {
                                    speed = 2;
                                  });
                                }),
                            InkWell(
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.white
                                                .withOpacity(0.3),
                                            offset: const Offset(0, 1),
                                            blurRadius: 10,
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(20),
                                        color: speed == 3
                                            ? Colors.white
                                            : activeColor),
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: speed == 3
                                              ? Colors.black
                                              : Colors.white),
                                      textAlign: TextAlign.center,
                                    )),
                                onTap: () {
                                  setState(() {
                                    speed = 3;
                                  });
                                }),
                          ]),
                    )
                  ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: activeColor),
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Power',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
                      child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text: 'ON',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                              TextSpan(
                                  text: '/',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                              TextSpan(
                                  text: 'OFF',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ])),
                            CupertinoSwitch(
                                value: switchValue,
                                activeColor: Colors.white,
                                onChanged: (value) {
                                  setState(() {
                                    if (switchValue == true) {
                                      setState(() {
                                        switchValue = false;
                                      });
                                    } else {
                                      setState(() {
                                        switchValue = true;
                                      });
                                    }
                                  });
                                })
                          ]),
                    ),
                  ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: activeColor),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Temp',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Slider(
                    min: 16,
                    max: 31,
                    thumbColor: Colors.white,
                    activeColor: Colors.white,
                    inactiveColor: activeColor,
                    value: sliderValue,
                    onChanged: (value) {
                      sliderValue = value;
                      log('onChange: $sliderValue');
                      log('${sliderValue ~/ 2 - 8}');
                      setState(() {
                        activeColor = _bodyColors[sliderValue ~/ 3 - 5];
                      });
                    })
              ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding sliderWidget() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SleekCircularSlider(
        min: 16,
        max: 31,
        appearance: CircularSliderAppearance(
          size: 250,
          customColors: CustomSliderColors(trackColor: Colors.transparent,
              // progressBarColors: [
              //   const Color(0xFFF62D2D),
              //   const Color(0xFFD3212D),
              //   const Color.fromARGB(255, 162, 38, 75),
              //   const Color.fromARGB(255, 114, 43, 106),
              //   const Color.fromARGB(255, 65, 47, 136),
              //   const Color.fromARGB(255, 16, 52, 166)
              // ],
              progressBarColors: [
                Colors.red,
                Colors.pink,
                Colors.purple,
                Colors.deepPurple,
                Colors.indigo,
                Colors.blue,
                Colors.lightBlue,
                Colors.cyan,
              ]),
        ),
        initialValue: sliderValue,
        onChange: (value) {
          log('onChange: $sliderValue');
          log('${sliderValue ~/ 2 - 8}');
          setState(() {
            sliderValue = value;
            activeColor = _bodyColors[sliderValue ~/ 2 - 8];
          });
        },
        innerWidget: (percentage) => Center(
          child: Container(
            height: 190,
            width: 190,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                '${percentage.toStringAsFixed(1)}°c',
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell buttons(IconData btnIcon, double weatherValue) {
    return InkWell(
      onTap: () {
        setState(() {
          sliderValue = weatherValue;
          activeColor = _bodyColors[sliderValue ~/ 3 - 5];
        });
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: activeColor,
        ),
        child: Center(
            child: Icon(
          btnIcon,
          color: Colors.white,
          size: 30,
        )),
      ),
    );
  }
}
