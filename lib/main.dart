import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/providers/homework.dart';
//import 'package:flutter_task_planner_app/providers/homework.dart';
import 'package:flutter_task_planner_app/providers/subjects.dart';
import 'package:flutter_task_planner_app/screens/homework_screen.dart';
import 'package:flutter_task_planner_app/screens/timetable_screen.dart';
import 'package:provider/provider.dart';
import './screens/home_page.dart';
import './theme/colors/light_colors.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xff2050df), // navigation bar color
    statusBarColor: Color(0xff2353e3), // status bar color
  ));

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Subjects(),
        ),
        ChangeNotifierProvider.value(
          value: Homework(),
        ),
      ],
      //value: Subjects(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: Theme.of(context).textTheme.apply(
              bodyColor: LightColors.kDarkBlue,
              displayColor: LightColors.kDarkBlue,
              fontFamily: 'Poppins'),
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        routes: {
          HomeworkScreen.routeName: (ctx) => HomeworkScreen(),
          TimeTableScreen.routeName: (ctx) => TimeTableScreen(),
        },
      ),
    );
  }
}
