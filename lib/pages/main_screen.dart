import 'package:flutter/material.dart';
import 'package:reminder_app/pages/reminders/reminders_page.dart';
import 'package:reminder_app/pages/routine_reminders/routine_reminders_page.dart';

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
    return Center(
      child: SizedBox(
        width: 140,
        height: 50,
        child: Card(
          color: Colors.amberAccent,
          child: Text(
            "Welcome",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
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
