import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart' as AC;
import 'package:one_clock/one_clock.dart' as DC;

class ClockWidgets {
  Widget analogClockWidget() {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: AC.AnalogClock.dark(
              dateTime: DateTime.now(),
              dialColor: Colors.white,
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
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }

  Widget digitalClockWidget() {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Center(
              child: DC.DigitalClock(
                  showSeconds: true,
                  isLive: true,
                  padding: EdgeInsets.all(15),
                  digitalClockTextColor: Colors.black,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius:
                      BorderRadius.all(Radius.circular(15))),
                  datetime: DateTime.now())
          ),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
