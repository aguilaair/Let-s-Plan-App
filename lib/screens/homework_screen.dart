import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/providers/homework.dart';
import 'package:flutter_task_planner_app/providers/subjects.dart';
import 'package:flutter_task_planner_app/widgets/add_task.dart';
import 'package:flutter_task_planner_app/widgets/homework_card.dart';
import 'package:flutter_task_planner_app/widgets/subject_icon.dart';
import 'package:flutter_task_planner_app/widgets/top_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeworkScreen extends StatelessWidget {
  static const routeName = "/homework";
  @override
  Widget build(BuildContext context) {
    final subjectData = Provider.of<Subjects>(context).items;
    final hwkProv = Provider.of<Homework>(context);
    final hwkData = hwkProv.pendingItems;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              TopContainer(
                //height: 300,
                //height: MediaQuery.of(context).size.height * 0.3,
                child: FittedBox(
                  //height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  iconSize: 25,
                                  icon: Icon(Icons.arrow_back_ios),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          "Your Homework",
                                          maxLines: 2,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Subjects",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      if (hwkProv.selectedSubjectList.length !=
                                          0)
                                        GestureDetector(
                                          onTap: (){
                                            hwkProv.clearFilter();
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(
                                                Icons.clear,
                                                color: Colors.white,
                                                size: 25,
                                              ),
                                              
                                              Text(
                                                "Clear Filters",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        )
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  width:
                                      MediaQuery.of(context).size.width * 0.7 -
                                          20,
                                  height: 100,
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30)),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (ctx, idx) {
                                          if (subjectData.length == idx) {
                                            return SubjectIcon(
                                                Subject(
                                                  id: "0",
                                                  title: "Add a subject",
                                                  color: Colors.grey,
                                                  icon: FontAwesomeIcons.plus,
                                                ),
                                                null);
                                          }
                                          return SubjectIcon(
                                              subjectData[idx], idx);
                                        },
                                        itemCount: subjectData.length + 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: hwkData.length != 0
                      ? HomeworkCard(hwkData)
                      : Center(
                          child: Text("Nothing to do, great job!"),
                        )),
              Container(
                width: double.infinity,
                child: RaisedButton.icon(
                  elevation: 0,
                  color: Color(0xff0731ae),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Add Homework",
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                      ),
                      context: context,
                      builder: (ctx) => Container(
                        height: MediaQuery.of(context).size.height - 150,
                        width: double.infinity,
                        //color: Colors.red,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              child: RaisedButton.icon(
                                elevation: 0,
                                onPressed: () => Navigator.of(context).pop(),
                                color: Color(0xff0731ae),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Add Homework",
                                  style: TextStyle(color: Colors.white),
                                ),
                                padding: EdgeInsets.all(10),
                              ),
                            ),
                            NewTask(
                              allowSelect: false,
                              sel: TaskType.homework,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
