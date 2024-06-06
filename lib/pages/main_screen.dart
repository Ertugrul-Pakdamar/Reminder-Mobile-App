import 'package:flutter/material.dart';
import 'package:reminder_app/pages/reminders/reminders_page.dart';
import 'package:reminder_app/pages/routine_reminders/routine_reminders_page.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';

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
        Card(
          child: Text(
            "Welcome",
            style: TextStyle(fontSize: 30),
          ),
          color: Colors.amber,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Card(
                color: Colors.white,
                shadowColor: Colors.white.withOpacity(0),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: AnalogClock.dark(
                    dateTime: DateTime.now(),
                    dialColor: Colors.amber,
                    markingColor: Colors.white,
                    markingWidthFactor: 1.2,
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
                    hourNumberColor: Colors.white,
                    hourHandColor: Colors.white,
                    hourHandLengthFactor: 0.7,
                    minuteHandColor: Colors.white,
                    minuteHandLengthFactor: 0.7,
                    secondHandColor: Colors.white,
                    secondHandLengthFactor: 0.7,
                    centerPointColor: null,
                  ),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Center(
                child: Card(
                  color: Colors.white.withOpacity(0),
                  shadowColor: Colors.white.withOpacity(0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${DateTime.now().hour} : ${DateTime.now().minute} . ${DateTime.now().second}",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
          ],
        ),
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
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.history),
          icon: Icon(Icons.history_outlined),
          label: 'Routines',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.notifications),
          icon: Icon(Icons.notifications_outlined),
          label: 'Reminders',
        ),
      ],
    );
  }
}
