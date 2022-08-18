import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:iot_ui/views/acControl.dart';
import 'package:iot_ui/widgets/DeviceCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(144, 255, 182, 236),
              Color.fromARGB(255, 235, 244, 245),
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hi,Sarthak',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'A total of 3 devices',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 20),
                              ),
                              const Text(
                                'Living Room',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const Icon(Icons.menu),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent:
                              MediaQuery.of(context).size.height * 0.3),
                      children: [
                        DeviceCard(
                          deviceName: 'Smart\nSpotlight',
                          deviceIcon: Icons.light,
                          deviceStatus: true,
                          gradientEnd: const Color.fromARGB(255, 243, 83, 90),
                          gradientStart: const Color.fromARGB(255, 243, 82, 82),
                          btnActiveColor:
                              const Color.fromARGB(255, 254, 136, 136),
                          route: '/acControl',
                        ),
                        DeviceCard(
                          deviceName: 'Smart\nSpeaker',
                          deviceIcon: EvaIcons.speaker,
                          deviceStatus: false,
                          gradientEnd: Color.fromARGB(255, 3, 180, 204),
                          gradientStart: const Color.fromARGB(255, 0, 172, 193),
                          btnActiveColor: Color.fromARGB(255, 88, 190, 203),
                          route: '/speakerControl',
                        ),
                        DeviceCard(
                          deviceName: 'Smart\nAC',
                          deviceIcon: Icons.ac_unit_rounded,
                          deviceStatus: true,
                          gradientEnd: const Color.fromARGB(255, 128, 85, 250),
                          gradientStart:
                              const Color.fromARGB(255, 128, 85, 250),
                          btnActiveColor:
                              const Color.fromARGB(255, 177, 148, 255),
                          route: '/acControl',
                        ),
                        DeviceCard(
                          deviceName: 'Smart\nTV',
                          deviceIcon: EvaIcons.tv_outline,
                          deviceStatus: true,
                          gradientEnd: const Color.fromARGB(255, 0, 200, 83),
                          gradientStart: Color.fromARGB(255, 1, 220, 92),
                          btnActiveColor: Color.fromARGB(255, 140, 255, 188),
                          route: '/acControl',
                        ),
                        DeviceCard(
                          deviceName: 'Smart\nTV',
                          deviceIcon: EvaIcons.tv_outline,
                          deviceStatus: true,
                          gradientEnd: const Color.fromARGB(255, 0, 200, 83),
                          gradientStart: Color.fromARGB(255, 1, 220, 92),
                          btnActiveColor: Color.fromARGB(255, 140, 255, 188),
                          route: '/acControl',
                        ),
                        DeviceCard(
                          deviceName: 'Smart\nTV',
                          deviceIcon: EvaIcons.tv_outline,
                          deviceStatus: true,
                          gradientEnd: const Color.fromARGB(255, 0, 200, 83),
                          gradientStart: Color.fromARGB(255, 1, 220, 92),
                          btnActiveColor: Color.fromARGB(255, 140, 255, 188),
                          route: '/acControl',
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
