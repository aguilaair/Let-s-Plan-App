import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Subject {
  final String id;
  final String title;
  final IconData icon;
  final Color color;

  Subject(
      {@required this.id,
      this.icon = FontAwesomeIcons.book,
      @required this.title,
      @required this.color});
}

class Subjects with ChangeNotifier {
  List<Subject> _items = [
    Subject(
        id: "1",
        icon: FontAwesomeIcons.virus,
        title: "Biology",
        color: Colors.green),
    Subject(
        id: "2",
        icon: FontAwesomeIcons.wind,
        title: "Physics",
        color: Colors.blue),
    Subject(
        id: "3",
        icon: FontAwesomeIcons.bookOpen,
        title: "English",
        color: Colors.purple),
    Subject(
        id: "4",
        icon: FontAwesomeIcons.flask,
        title: "Chemistry",
        color: Colors.red),
    Subject(
        id: "5",
        icon: FontAwesomeIcons.calculator,
        title: "Maths",
        color: Colors.orange),
    Subject(
        id: "6",
        icon: FontAwesomeIcons.globeEurope,
        title: "Geography",
        color: Colors.teal),
    Subject(
        id: "7",
        icon: FontAwesomeIcons.bookReader,
        title: "Lengua",
        color: Colors.red),
    Subject(
        id: "8",
        icon: FontAwesomeIcons.boxOpen,
        title: "CCSS",
        color: Colors.orange),
    Subject(
        id: "9",
        icon: FontAwesomeIcons.bookmark,
        title: "History",
        color: Colors.brown),
    Subject(
        id: "10",
        icon: FontAwesomeIcons.feather,
        title: "Latin",
        color: Colors.yellow),
  ];

  List<Subject> get items {
    return [..._items];
  }

  void addItem({
    @required Subject addItem,
    idx = 0,
  }) {
    _items.insert(idx, addItem);
    notifyListeners();
  }

  Subject removeItem(String id) {
    final item = _items.firstWhere((element) => element.id == id);
    _items.removeWhere((element) => element == item);
    //notifyListeners();
    return item;
  }

  Subject getSubjectbyId(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
