import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agenda"),
        centerTitle: true,
      ),
      //drawer: const Menu(),
      body: TableCalendar(
        headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
        firstDay: DateTime.now(),
        lastDay: DateTime.now().add(const Duration(days: 30)),
        calendarFormat: _calendarFormat,
        focusedDay: _focusedDay,
        selectedDayPredicate: (DateTime date){
          return isSameDay(_selectedDay, date);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              //print(selectedDay);
              Get.toNamed('/horarios', arguments: _selectedDay);
            });
          }
        },
      ),
    );
  }
}