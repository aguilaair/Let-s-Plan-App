import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/providers/homework.dart';
import 'package:flutter_task_planner_app/providers/subjects.dart';
import 'package:flutter_task_planner_app/widgets/subject_bubble.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'create_subject.dart';

class SubjectIcon extends StatefulWidget {
  final Subject subjectData;
  final int idx;

  SubjectIcon(this.subjectData, this.idx);

  @override
  _SubjectIconState createState() => _SubjectIconState();
}

class _SubjectIconState extends State<SubjectIcon> {
  @override
  Widget build(BuildContext context) {
    bool selected = Provider.of<Homework>(context)
        .selectedSubjectList
        .contains(widget.subjectData.id);
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      highlightColor: Colors.grey.withOpacity(0.1),
      onTap: () {
        if (widget.subjectData.id == "0") {
          return showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
              ),
            ),
            context: context,
            builder: (ctx) {
              return CreateSubject();
            },
          );
        } else {
          setState(() {
            Provider.of<Homework>(context, listen: false)
                .addsubj(widget.subjectData.id);
          });
        }
      },
      child: AbsorbPointer(
        absorbing: widget.idx == null ? true : false,
        child: Dismissible(
          key: Key(widget.subjectData.id + "subject"),
          direction: DismissDirection.up,
          background: Icon(
            FontAwesomeIcons.times,
            color: Colors.white,
          ),
          onDismissed: (dir) {
            final _item = Provider.of<Subjects>(context, listen: false)
                .removeItem(widget.subjectData.id);
            final _itemsDeleted = Provider.of<Homework>(context, listen: false)
                .deleteAllSubjectTasks(widget.subjectData.id);

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
                    Text("Subject removed!")
                  ],
                ),
                action: SnackBarAction(
                  label: "UNDO",
                  onPressed: () {
                    Provider.of<Subjects>(context, listen: false)
                        .addItem(addItem: _item);
                    Provider.of<Homework>(context, listen: false)
                        .addMultipleTasks(_itemsDeleted);
                  },
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  SubjectBubble(
                    subjectData: widget.subjectData,
                    selected: selected,
                  ),
                  //SizedBox(height: 5,),
                  Text(
                    widget.subjectData.title,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
