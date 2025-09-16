import 'package:flutter/material.dart';

enum Calender { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calender showCalender = Calender.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calender>(
      segments: <ButtonSegment<Calender>>[
        buttonSegment(Calender.day, 'Day', Icons.calendar_view_day),
        buttonSegment(Calender.week, 'Week', Icons.calendar_view_week),

        buttonSegment(Calender.month, 'Month', Icons.calendar_view_month),

        buttonSegment(Calender.year, 'Year', Icons.calendar_today),
      ],
      selected: <Calender>{showCalender},
      onSelectionChanged: (Set<Calender> newSelection) {
        setState(() {
          showCalender = newSelection.first;
        });
      },
    );
  }

  ButtonSegment<Calender> buttonSegment(
    Calender value,
    String text,
    IconData icon,
  ) {
    return ButtonSegment(value: value, label: Text(text), icon: Icon(icon));
  }
}
