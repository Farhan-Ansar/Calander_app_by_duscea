import 'package:duseca_calender_app/AppConstant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendarWidget extends StatelessWidget {
  final List<DateTime> _selectedDays = [
    DateTime(2024, 11, 15),
    DateTime(2024, 11, 20),
    DateTime(2024, 11, 18),
    DateTime(2024, 11, 24),
  ];

  MyCalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        child: TableCalendar(
          daysOfWeekVisible: true,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          selectedDayPredicate: (day) {
            return _selectedDays.contains(day);
          },
          onDaySelected: (selectedDay, focusedDay) {},
          calendarStyle: CalendarStyle(
            selectedDecoration: const BoxDecoration(
              color: kColorRed,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: kColorBlue,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.r),
            ),
            markersMaxCount: 1,
            markerDecoration: const BoxDecoration(
              color: kColorRed,
              shape: BoxShape.circle,
            ),
          ),
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronIcon: Icon(Icons.arrow_back),
            rightChevronIcon: Icon(Icons.arrow_forward),
          ),
          eventLoader: (day) {
            return _selectedDays
                .where((selectedDay) => isSameDay(selectedDay, day))
                .toList();
          },
        ),
      ),
    );
  }
}
