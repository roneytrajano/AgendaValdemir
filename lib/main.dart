import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/calendar/calendar_screen.dart';
import 'modules/home/home_screen.dart';
import 'modules/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Agenda',
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/calendar', page: () => const CalendarScreen())
      ],
    );
  }
}

