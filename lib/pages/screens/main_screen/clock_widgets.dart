import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart' as AC;
import 'package:one_clock/one_clock.dart' as DC;

class ClockWidgets {
  Widget analogClockWidget() {
    return SizedBox(
      height: 175,
      width: 175,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: AC.AnalogClock.dark(
          dateTime: DateTime.now(),
          dialColor: Colors.amber,
          markingColor: Color(0xff614151),
          markingWidthFactor: 1.2,
          markingRadiusFactor: 0.95,
          hourNumbers: const [
            '',
            '',
            '3',
            '',
            '',
            '6',
            '',
            '',
            '9',
            '',
            '',
            '12'
          ],
          hourNumberSizeFactor: 0.9,
          hourNumberColor: Colors.black,
          hourHandColor: Colors.black,
          hourHandLengthFactor: 0.7,
          minuteHandColor: Colors.black,
          minuteHandLengthFactor: 0.7,
          secondHandColor: Colors.red,
          secondHandLengthFactor: 0.7,
          centerPointColor: null,
        ),
      ),
    );
  }

  Widget digitalClockWidget() {
    return SizedBox(
      height: 40,
      width: 175,
      child: Container(
        child: DC.DigitalClock(
          showSeconds: true,
          isLive: true,
          digitalClockTextColor: Colors.black,
          decoration: const BoxDecoration(
            color: Colors.amber,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          datetime: DateTime.now(),
        ),
      ),
    );
  }
}
