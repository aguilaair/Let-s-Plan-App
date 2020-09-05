import 'package:flutter/material.dart';
import '../dates_list.dart';
import '../theme/colors/light_colors.dart';
import '../widgets/calendar_dates.dart';
import '../widgets/task_container.dart';
import '../screens/create_new_task_page.dart';
import '../widgets/back_button.dart';

class CalendarPage extends StatelessWidget {


  Widget _dashedText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        '------------------------------------------',
        maxLines: 1,
        style:
            TextStyle(fontSize: 20.0, color: Colors.black12, letterSpacing: 5),
      ),
    );
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
                      Text(
                        'Today',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w700),
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
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'April, 2020',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CalendarDates(
                      day: days[index],
                      date: dates[index],
                      dayColor: index == 0 ? LightColors.kRed : Colors.black54,
                      dateColor:
                          index == 0 ? LightColors.kRed : LightColors.kDarkBlue,
                    );
                  },
                ),
              ),
              Expanded(
                //flex: 9,
                child: SingleChildScrollView(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            itemCount: time.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${time[index]} ${time[index] > 8 ? 'PM' : 'AM'}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              _dashedText(),
                              TaskContainer(
                                title: 'Project Research',
                                subtitle:
                                    'Discuss with the colleagues about the future plan',
                                boxColor: LightColors.kLightYellow2,
                              ),
                              _dashedText(),
                              TaskContainer(
                                title: 'Work on Medical App',
                                subtitle: 'Add medicine tab',
                                boxColor: LightColors.kLavender,
                              ),
                              TaskContainer(
                                title: 'Call',
                                subtitle: 'Call to david',
                                boxColor: LightColors.kPalePink,
                              ),
                              TaskContainer(
                                title: 'Design Meeting',
                                subtitle:
                                    'Discuss with designers for new task for the medical app',
                                boxColor: LightColors.kLightGreen,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
