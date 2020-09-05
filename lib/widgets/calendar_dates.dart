import 'package:flutter/material.dart';


class CalendarDates extends StatelessWidget {
  final String day;
  final String date;
  final Color dayColor;
  final Color dateColor;

  CalendarDates({this.day, this.date, this.dayColor, this.dateColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(right: 20.0),
      child: FittedBox(
        alignment: Alignment.center,
              child: Column(
          children: <Widget>[
            Text(
              day,
              style: TextStyle(
                  fontSize: 16, color: dayColor, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10.0),
            Text(
              date,
              style: TextStyle(
                  fontSize: 16, color: dateColor, fontWeight: FontWeight.w700),
            ),
            //SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}