import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/providers/subjects.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubjectBubble extends StatelessWidget {
  final bool selected;

  const SubjectBubble({
    Key key,
    @required this.subjectData,
    this.selected = false,
  }) : super(key: key);

  final Subject subjectData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(5),
          child: FittedBox(
            child: Icon(
              subjectData.icon,
              size: 25.0,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [subjectData.color, subjectData.color.withOpacity(0.7)],
            ),
            shape: BoxShape.circle,
          ),
        ),
        if(selected) Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(5),
          child: FittedBox(
            child: Icon(
              FontAwesomeIcons.checkCircle,
              size: 25.0,
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.8),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
