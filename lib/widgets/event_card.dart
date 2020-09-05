import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventCard extends StatelessWidget {
  EventCard();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().toString()),
      onDismissed: (dir) {
        if (dir.index == 3) {
        } else if (dir.index == 2) {}
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
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
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
                  FontAwesomeIcons.calendarAlt,
                  size: 30.0,
                  color: Colors.white.withOpacity(0.5),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff40E0D0),
                      //Color(0xffFF8C00),
                      Color(0xffFF0080),
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
                      "Event Title",
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      "Event description here",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      "Time goes here",
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
  }
}
