import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/providers/homework.dart';
import 'package:flutter_task_planner_app/providers/subjects.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeworkCard extends StatelessWidget {
  final List<HomeworkItem> hwkData;

  HomeworkCard(this.hwkData);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        itemBuilder: (ctx, idx) {
          final hwk = hwkData[idx];
          return Dismissible(
            key: Key(hwk.id + "Item"),
            onDismissed: (dir) {
              if (dir.index == 3) {
                Provider.of<Homework>(context, listen: false)
                    .remItem(hwkData[idx].id);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Color(0xFF323232).withOpacity(0.95),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    content: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.times,
                          size: 20,
                        ),
                        SizedBox(width: 15),
                        Text("Task removed!")
                      ],
                    ),
                    action: SnackBarAction(
                      label: "UNDO",
                      onPressed: () {
                        Provider.of<Homework>(context, listen: false)
                            .addItem(hwkData[idx], idx);
                      },
                    ),
                  ),
                );
              } else if (dir.index == 2) {
                final index = Provider.of<Homework>(context, listen: false)
                    .triggerComplete(hwkData[idx]);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Color(0xFF323232).withOpacity(0.95),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    content: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.checkDouble,
                          size: 20,
                        ),
                        SizedBox(width: 15),
                        Text("Task completed!")
                      ],
                    ),
                    action: SnackBarAction(
                      label: "UNDO",
                      onPressed: () {
                        Provider.of<Homework>(context, listen: false)
                            .triggerComplete(hwkData[idx],idx: index);
                      },
                    ),
                  ),
                );
              }
            },
            background: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffDA4453),
                    Color(0xff89216B),
                  ],
                ),
                borderRadius: BorderRadius.circular(1000),
              ),
              alignment: Alignment.centerLeft,
              child: Icon(
                FontAwesomeIcons.times,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            secondaryBackground: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff1D976C),
                    Color(0xff93F9B9),
                  ],
                ),
                borderRadius: BorderRadius.circular(1000),
              ),
              alignment: Alignment.centerRight,
              child: Icon(
                FontAwesomeIcons.check,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.all(5),
                      child: Icon(
                        FontAwesomeIcons.pen,
                        size: 30.0,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffA770EF),
                            Color(0xffCF8BF3),
                            Color(0xffFDB99B),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hwk.title,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            hwk.description,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          Text(
                            Provider.of<Subjects>(context)
                                .getSubjectbyId(hwk.subjectId)
                                .title,
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: hwkData.length,
      ),
    );
  }
}
