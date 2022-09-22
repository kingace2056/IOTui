import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_ui/views/homepage.dart';
import 'package:iot_ui/views/sound/equalizer.dart';
import 'package:iot_ui/views/sound/speakerControl.dart';

import 'views/acControl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomePage(),
        // '/': (context) => const Equalizer(),
        '/acControl': (context) => const AcControl(),
        '/speakerControl': (context) => SpeakerControl()
      },
    );
  }
}
