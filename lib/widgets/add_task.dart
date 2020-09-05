import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/providers/homework.dart';
import 'package:flutter_task_planner_app/providers/subjects.dart';
import 'package:flutter_task_planner_app/widgets/subject_bubble.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewTask extends StatefulWidget {
  final bool allowSelect;
  final TaskType sel;

  NewTask({this.allowSelect, this.sel});
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _formKey = GlobalKey<FormState>();

  var item = HomeworkItem(
    id: DateTime.now().toString(),
    title: null,
    description: null,
    dueOn: null,
    subjectId: null,
    completed: false,
    type: null,
  );

  void addTask() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      Provider.of<Homework>(context, listen: false).addItem(item, 0);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    TaskType sel = widget.sel;
    Subject selSubj;
    return Form(
      key: _formKey,
      child: Expanded(
        child: ListView(
          padding: EdgeInsets.all(20),
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(40),
                  //margin: EdgeInsets.all(20),
                  child: Icon(
                    FontAwesomeIcons.pen,
                    size: 60,
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
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextFormField(
                        expands: false,
                        decoration: InputDecoration(hintText: "Title"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          item = item = HomeworkItem(
                            id: DateTime.now().toString(),
                            title: val,
                            description: item.description,
                            dueOn: item.dueOn,
                            subjectId: item.subjectId,
                            completed: item.completed,
                            type: item.type,
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DateTimeField(
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Please enter a date';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          item = item = HomeworkItem(
                            id: DateTime.now().toString(),
                            title: item.title,
                            description: item.description,
                            dueOn: val.toIso8601String(),
                            subjectId: item.subjectId,
                            completed: item.completed,
                            type: item.type,
                          );
                        },
                        decoration: InputDecoration(hintText: "Due On"),
                        format: DateFormat("yyyy-MM-dd"),
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Description"),
              maxLines: 3,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              onSaved: (val) {
                item = HomeworkItem(
                  id: DateTime.now().toString(),
                  title: item.title,
                  description: val,
                  dueOn: item.dueOn,
                  subjectId: item.subjectId,
                  completed: item.completed,
                  type: item.type,
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: DropdownButtonFormField(
                    hint: Text("Select task type"),
                    value: sel,
                    items: [
                      DropdownMenuItem(
                        child: Text("Homework"),
                        value: TaskType.homework,
                      ),
                      DropdownMenuItem(
                        child: Text("Exam"),
                        value: TaskType.exam,
                      ),
                      DropdownMenuItem(
                        child: Text("Notes"),
                        value: TaskType.notes,
                      ),
                      DropdownMenuItem(
                        child: Text("Read"),
                        value: TaskType.read,
                      ),
                    ],
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter a task type';
                      }
                      return null;
                    },
                    onChanged: (sele) {
                      sel = sele;
                    },
                    onSaved: (val) {
                      item = item = HomeworkItem(
                        id: DateTime.now().toString(),
                        title: item.title,
                        description: item.description,
                        dueOn: item.dueOn,
                        subjectId: item.subjectId,
                        completed: item.completed,
                        type: val,
                      );
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: DropdownButtonFormField(
                    hint: Text("Select subject"),
                    value: selSubj,
                    items: Provider.of<Subjects>(context)
                        .items
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Row(
                              children: [
                                SubjectBubble(
                                  subjectData: e,
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(e.title),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (sele) {
                      selSubj = sele;
                    },
                    onSaved: (val) {
                      item = item = HomeworkItem(
                        id: DateTime.now().toString(),
                        title: item.title,
                        description: item.description,
                        dueOn: item.dueOn,
                        subjectId: val.id,
                        completed: item.completed,
                        type: item.type,
                      );
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please enter a Subject';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: addTask,
              child: Container(
                height: 80,
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Create Task',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width - 40,
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff04e2a9), Color(0xAA09f7b9)]),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
