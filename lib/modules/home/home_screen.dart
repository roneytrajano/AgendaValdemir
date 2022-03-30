import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agenda"),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Calendario'),
              onTap: () {
                // Update the state of the app.
                // ...
                Get.offAndToNamed('/home');
              },
            ),
            ListTile(
              title: const Text('Splash'),
              onTap: () {
                // Update the state of the app.
                // ...
                Get.offAndToNamed('/splash');
              },
            ),
          ],
        ),
      ),
      body: TableCalendar(
        firstDay: DateTime.now().add(const Duration(days: -31)),
        lastDay: DateTime.now().add(const Duration(days: 31)),
        focusedDay: DateTime.now(),
      ),
    );
  }
}