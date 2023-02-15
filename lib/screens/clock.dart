// package to create analog clock
import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

// function to trigger the build process
void main() => runApp(const ShowClock());

class ShowClock extends StatefulWidget {
  const ShowClock({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _ShowClockState createState() => _ShowClockState();
}

class _ShowClockState extends State<ShowClock> {
  @override
// building the app widgets
  Widget build(BuildContext context) => Container(
        width: 200,
        height: 200,

        child: Center(
          child: AnalogClock(
            decoration: BoxDecoration(
                color: Colors.black87, shape: BoxShape.circle), // decoration
            isLive: true,
            hourHandColor: Colors.white,
            minuteHandColor: Colors.white,
            showSecondHand: true,
            numberColor: Colors.white,
            showNumbers: true,
            showTicks: true,
            showDigitalClock: true,
            digitalClockColor: Colors.white,
            datetime: DateTime(2020, 8, 4, 9, 11, 0),
          ), // analog clock
        ), // center
      );
  // material app
}
