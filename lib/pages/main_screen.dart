import 'package:flutter/material.dart';
import 'package:reminder_app/pages/reminders/reminders_page.dart';
import 'package:reminder_app/pages/routine_reminders/routine_reminders_page.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart' as AC;
import 'package:one_clock/one_clock.dart' as DC;

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainAppState();
}

class MainAppState extends State {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBarWidget(),
        body: <Widget>[
          homePageWidet(),
          RoutineRemindersPage(),
          RemindersPage()
        ][currentPageIndex]);
  }

  Widget homePageWidet() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        welcomeCardWidget(),
        SizedBox(
          height: 10,
        ),
        analogClockWidget(),
        digitalClockWidget(),
        Expanded(child: SizedBox()),
      ],
    );
  }

  Widget NavigationBarWidget() {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      indicatorColor: Colors.amber,
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home, color: Color(0xff614151)),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.history, color: Color(0xff614151)),
          icon: Icon(Icons.history_outlined),
          label: 'Routines',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.notifications, color: Color(0xff614151)),
          icon: Icon(Icons.notifications_outlined),
          label: 'Reminders',
        ),
      ],
    );
  }

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
            child: Card(
                color: Colors.white.withOpacity(0),
                shadowColor: Colors.white.withOpacity(0),
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
                    datetime: DateTime.now())),
          ),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }

  Widget welcomeCardWidget() {
    return Card(
      child: Text(
        "Welcome",
        style: TextStyle(fontSize: 30),
      ),
      color: Colors.amber,
    );
  }
}
