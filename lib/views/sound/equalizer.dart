import 'package:flutter/material.dart';

Map<String, double> sliderValues = {
  '32': 10,
  // '64': 10,
  '125': 10,
  // '250': 10,
  '500': 20,
  '1k': 10,
  '2k': 10,
  // '4k': 10,
  '8k': 10,
  '16k': 10,
};

class Equalizer extends StatefulWidget {
  const Equalizer({super.key});

  @override
  State<Equalizer> createState() => _EqualizerState();
}

class _EqualizerState extends State<Equalizer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        // list of widgets
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
            sliderValues.length,
            (index) => EqualizerSlider(
                freqVal: sliderValues.keys.elementAt(index),
                sliderVal: sliderValues.values.elementAt(index))),
        // children: [
        //   EqualizerSlider(
        //     freqVal: '32',
        //     sliderVal: 10,
        //   ),
        //   EqualizerSlider(
        //     freqVal: '64',
        //     sliderVal: 10,
        //   ),
        //   EqualizerSlider(
        //     freqVal: '125',
        //     sliderVal: 10,
        //   ),
        //   EqualizerSlider(
        //     freqVal: '250',
        //     sliderVal: 10,
        //   ),
        //   EqualizerSlider(
        //     freqVal: '500',
        //     sliderVal: 10,
        //   ),
        //   EqualizerSlider(
        //     freqVal: '1K',
        //     sliderVal: 10,
        //   ),
        //   EqualizerSlider(
        //     freqVal: '2K',
        //     sliderVal: 10,
        //   ),
        //   EqualizerSlider(
        //     freqVal: '4K',
        //     sliderVal: 10,
        //   ),
        //   EqualizerSlider(
        //     freqVal: '8K',
        //     sliderVal: 10,
        //   ),
        //   EqualizerSlider(
        //     freqVal: '16K',
        //     sliderVal: 10,
        //   ),
        // ],
      ),
    );
  }
}

class EqualizerSlider extends StatefulWidget {
  double sliderVal;
  String freqVal;
  EqualizerSlider({
    Key? key,
    required this.sliderVal,
    required this.freqVal,
  }) : super(key: key);

  @override
  State<EqualizerSlider> createState() => _EqualizerSliderState();
}

class _EqualizerSliderState extends State<EqualizerSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RotatedBox(
            quarterTurns: -1,
            child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 6),
                    trackHeight: 5,
                    activeTrackColor: Colors.black),
                child: Slider(
                    value: widget.sliderVal,
                    thumbColor: Colors.white,
                    min: 0,
                    max: 20,
                    onChanged: ((value) {
                      setState(() {
                        widget.sliderVal = value;
                      });
                    }))),
          ),
          Text(
            widget.freqVal,
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
