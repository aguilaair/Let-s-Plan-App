import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'package:flutter_task_planner_app/providers/subjects.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CreateSubject extends StatefulWidget {
  const CreateSubject({
    Key key,
  }) : super(key: key);

  @override
  _CreateSubjectState createState() => _CreateSubjectState();
}

class _CreateSubjectState extends State<CreateSubject> {
  TextEditingController titleController = TextEditingController();

  IconData _icon = FontAwesomeIcons.plus;
  Color _color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4 - 40,
                  child: Column(
                    children: [
                      Text(
                        "Icon:",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        width: [MediaQuery.of(context).size.width * 0.3, 200]
                            .reduce(min),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: [_color, _color.withOpacity(0.7)])),
                        child: FittedBox(
                          child: IconButton(
                            icon: Icon(
                              _icon,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () async {
                              IconData icon =
                                  await FlutterIconPicker.showIconPicker(
                                context,
                                iconPackMode: IconPack.fontAwesomeIcons,
                                iconPickerShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              );
                              if (icon == null) {
                                return;
                              }

                              setState(() {
                                _icon = icon;
                              });
                              colorPicker(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: "Title"),
                  ),
                  width: MediaQuery.of(context).size.width * 0.6 - 30,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.65,
                height: 50,
                decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    borderRadius: BorderRadius.circular(30),
                    gradient: LightColors.mainGradient),
                child: Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      //fontFamily: "Poppins"
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                if (titleController.text.length <= 0) {
                  //print("object");
                  return;
                }
                Provider.of<Subjects>(context, listen: false).addItem(
                  addItem: Subject(
                    color: _color,
                    icon: _icon,
                    title: titleController.text,
                    id: DateTime.now().toString(),
                  ),
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future colorPicker(BuildContext context) {
    return showDialog(
      context: context,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: const Text('Great, now pick a colour!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerAreaBorderRadius: BorderRadius.circular(30),
            pickerColor: _color,
            onColorChanged: (col) => _color = col,
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Got it'),
            onPressed: () {
              setState(() {});
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
