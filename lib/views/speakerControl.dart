import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

double sliderValue = 30;

class SpeakerControl extends StatefulWidget {
  const SpeakerControl({Key? key}) : super(key: key);

  @override
  State<SpeakerControl> createState() => _SpeakerControlState();
}

class _SpeakerControlState extends State<SpeakerControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Speaker'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(8),
              child: SleekCircularSlider(
                min: 0,
                max: 100,
                appearance: CircularSliderAppearance(
                  size: 250,
                  customWidths: CustomSliderWidths(
                      progressBarWidth: 20,
                      trackWidth: 15,
                      shadowWidth: 0,
                      handlerSize: 15),
                  customColors: CustomSliderColors(
                    progressBarColor: Color.fromARGB(255, 3, 180, 204),
                    trackColor: Colors.grey,
                    dotColor: Color.fromARGB(255, 3, 180, 204),
                  ),
                ),
                initialValue: sliderValue,
                onChange: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
                innerWidget: (percentage) => Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      boxShadow: [
                        // BoxShadow(
                        //    color: Colors.black.withOpacity(0.2),
                        //   blurRadius: 10,
                        //   spreadRadius: 5,
                        // ),
                      ],
                      shape: BoxShape.circle,
                      // color: Colors.transparent,
                    ),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.volume_up_sharp),
                        Text(
                          '${sliderValue.toInt()}',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
