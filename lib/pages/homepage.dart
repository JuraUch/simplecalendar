import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _focusDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
              width: MediaQuery.of(context).size.width * 0.80,
              padding: const EdgeInsets.all(11.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0), color: const Color(0xffffffff), boxShadow: const [BoxShadow(color: Color(0x12000000), offset: Offset(0, 7), blurRadius: 24)]),
              child: _tableCalendar(),
            ),
            Container(),
          ],
        ),
      ),
    );
  }

  _tableCalendar() {
    return TableCalendar(
      locale: 'pt_BR',
      focusedDay: _focusDay,
      firstDay: DateTime(1900),
      lastDay: DateTime(2100),
      calendarFormat: CalendarFormat.month,
      calendarStyle: _calendarStyle(),
      headerStyle: _headerStyle(),
      selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
      onPageChanged: (focusedDay) => _focusDay = focusedDay,
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusDay = focusedDay;
          });
        }
      },
    );
  }

  _calendarStyle() {
    return const CalendarStyle(
      defaultTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Color(0xff000000),
        height: 1.3333333333333333,
      ),
      weekendTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Color(0xffD4D411),
        height: 1.3333333333333333,
      ),
      markersMaxCount: 20,
      outsideTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Color(0xfff0efcd),
        height: 1.3333333333333333,
      ),
      todayTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Color(0xff000000),
      ),
    );
  }

  _headerStyle() {
    return HeaderStyle(
      titleTextStyle: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        fontSize: 15,
        color: Color(0xff000000),
        height: 1.3333333333333333,
      ),
      leftChevronIcon: const Icon(
        Icons.keyboard_arrow_left,
        size: 20,
        color: Colors.black,
      ),
      formatButtonTextStyle: const TextStyle(color: Colors.blue),
      rightChevronIcon: const Icon(
        Icons.keyboard_arrow_right,
        size: 20,
        color: Colors.black,
      ),
      formatButtonVisible: false,
      titleCentered: true,
      titleTextFormatter: (date, locale) => DateFormat.yMMMM(locale).format(date).toUpperCase(),
    );
  }
}
