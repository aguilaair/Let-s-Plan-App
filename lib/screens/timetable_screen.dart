import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/widgets/back_button.dart';
import 'package:flutter_task_planner_app/widgets/event_card.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import 'create_new_task_page.dart';

class TimeTableScreen extends StatefulWidget {
  static const routeName = "/time-table-screen";
  @override
  _TimeTableScreenState createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  var time = DateTime.now();
  final now = DateTime.now();
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              MyBackButton(true),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        height: 50,
                        child: FittedBox(
                          alignment: Alignment.centerLeft,
                          fit: BoxFit.contain,
                          child: Text(
                            DateTime(
                                      time.year,
                                      time.month,
                                      time.day,
                                    )
                                        .difference(
                                          DateTime(
                                            now.year,
                                            now.month,
                                            now.day,
                                          ),
                                        )
                                        .inDays ==
                                    0
                                ? 'Today'
                                : DateFormat("d of MMMM, y").format(time),
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 40.0,
                        width: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xff04e2a9), Color(0xAA09f7b9)]),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CreateNewTaskPage(),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              'Add task',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Here\'s what you have to do today, John',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              ClipPath(
                clipper: WaveClipperTwo(reverse: true),
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    gradient: LightColors.mainGradient,
                  ),
                  child: Container(
                    //width: MediaQuery.of(context).size.width,
                    //height: 300,
                    //height: MediaQuery.of(context).size.height * 0.35,
                    child: TableCalendar(
                      onVisibleDaysChanged: (sDate, eDate, format) {
                        print(format);
                      },
                      rowHeight: 50,
                      availableCalendarFormats: {CalendarFormat.week: 'Week'},
                      initialCalendarFormat: CalendarFormat.week,
                      initialSelectedDay: DateTime.now(),
                      onDaySelected: (date, list) {
                        //print(list);
                        setState(
                          () {
                            time = date;
                          },
                        );
                      },
                      calendarStyle: CalendarStyle(
                          selectedColor: Colors.white,
                          selectedStyle: TextStyle(color: Colors.black54),
                          weekdayStyle: TextStyle(color: Colors.white),
                          weekendStyle: TextStyle(color: Colors.white54),
                          outsideStyle: TextStyle(color: Colors.greenAccent),
                          outsideWeekendStyle: TextStyle(color: Colors.green),
                          todayColor: Colors.grey.withOpacity(0.5)),
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekendStyle: TextStyle(color: Colors.grey),
                          weekdayStyle: TextStyle(color: Colors.white)),
                      headerStyle: HeaderStyle(
                        decoration: BoxDecoration(),
                        titleTextStyle: TextStyle(color: Colors.white),
                        formatButtonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        leftChevronIcon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                        rightChevronIcon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      calendarController: _calendarController,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, idx) => EventCard(),
                  itemCount: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
