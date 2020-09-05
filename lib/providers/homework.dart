import 'package:flutter/material.dart';

enum TaskType {
  exam,
  homework,
  notes,
  read,
}


class HomeworkItem {
  final String id;
  final String title;
  final String description;
  final String dueOn;
  final String subjectId;
  final bool completed;
  final TaskType type;

  HomeworkItem({
    @required this.id,
    @required this.title,
    @required this.dueOn,
    @required this.description,
    @required this.subjectId,
    this.type = TaskType.homework,
    this.completed = false,
  });
}

class Homework with ChangeNotifier {
  List<String> _listSubj = [];
  List<HomeworkItem> _items = [
    HomeworkItem(
      id: "1",
      title: "Finish task 3a",
      dueOn: null,
      description: "Page 324, green bio book",
      subjectId: "1", //Biology
      type: TaskType.homework,
    ),
    HomeworkItem(
      id: "2",
      title: "Do experiment",
      dueOn: null,
      description: "Titration experiments. Instructions online.",
      subjectId: "2", //Physics
      type: TaskType.homework,
    ),
    HomeworkItem(
      id: "3",
      title: "Write macbeth essay",
      dueOn: null,
      description:
          "Act 2 Scene 3. How does the porter bring comedy to the play?",
      subjectId: "3", //English
      type: TaskType.homework,
    ),
    HomeworkItem(
      id: "4",
      title: "Write Poem",
      dueOn: null,
      description: "Book of Hopes, upload to Google Clasroom stream.",
      subjectId: "3", //English
      type: TaskType.homework,
    ),
    HomeworkItem(
      id: "5",
      title: "Vocab",
      dueOn: null,
      description: "Learn vocab on pages 10-15",
      subjectId: "10", //French
      type: TaskType.homework,
    ),
    HomeworkItem(
      id: "6",
      title: "Finish past paper",
      dueOn: null,
      description: "Questions 15-31",
      subjectId: "3", //English+
      type: TaskType.homework,
    ),
    HomeworkItem(
      id: "7",
      title: "Finish Paper 1",
      dueOn: null,
      description: "Finish part C of 2015 November paper 12",
      subjectId: "3", //English
      type: TaskType.homework,
    ),
    HomeworkItem(
      id: "8",
      title: "Write macbeth essay",
      dueOn: null,
      description:
          "Write macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essay",
      subjectId: "3", //English
      type: TaskType.homework,
    ),
    HomeworkItem(
      id: "9",
      title: "Write macbeth essay",
      dueOn: null,
      description:
          "Write macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essay",
      subjectId: "3", //English
      type: TaskType.homework,
    ),
    HomeworkItem(
      id: "10",
      title: "Write macbeth essay",
      dueOn: null,
      description:
          "Write macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essay",
      subjectId: "3", //English
      type: TaskType.homework,
    ),
    HomeworkItem(
      id: "11",
      title: "Write macbeth essay",
      dueOn: null,
      description:
          "Write macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essay",
      subjectId: "3", //English
      type: TaskType.homework,
    ),
    HomeworkItem(
      id: "12",
      title: "Write macbeth essay",
      dueOn: null,
      description:
          "Write macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essayWrite macbeth essay",
      subjectId: "3", //English
      type: TaskType.homework,
    ),
  ];

  

  List<HomeworkItem> get items {
    _items.sort((a, b) => DateTime.parse(a.dueOn).compareTo(DateTime.parse(b.dueOn)));
    List<HomeworkItem> _list = [];
    if (_listSubj.length == 0) {
      return [..._items];
    }
    _listSubj.forEach((eid) {
      _list.addAll(_items.where((element) => element.subjectId == eid));
    });
    return [..._list];
  }

  List<HomeworkItem> get pendingItems {
    List<HomeworkItem> _list = [];
    if (_listSubj.length == 0) {
      return [
        ..._items.where((element) => element.completed == false).toList()
      ];
    }
    _listSubj.forEach((eid) {
      _list.addAll(_items.where((element) => element.subjectId == eid));
    });
    return [..._list.where((element) => element.completed == false).toList()];
  }

  List<HomeworkItem> get completedItems {
    List<HomeworkItem> _list = [];
    if (_listSubj.length == 0) {
      return [..._items.where((element) => element.completed == true).toList()];
    }
    _listSubj.forEach((eid) {
      _list.addAll(_items.where((element) => element.subjectId == eid));
    });
    return [..._list.where((element) => element.completed == true).toList()];
  }

  List<String> get selectedSubjectList {
    return _listSubj;
  }

  void addsubj(String id) {
    if (_listSubj.contains(id)) {
      _listSubj.remove(id);
    } else {
      _listSubj.insert(0, id);
    }
    notifyListeners();
  }

  List<HomeworkItem> deleteAllSubjectTasks(String id) {
    List<HomeworkItem> itemsDeleted = [];
    itemsDeleted = _items.where((element) => element.subjectId == id).toList();
    _items.removeWhere((element) => element.subjectId == id);
    notifyListeners();
    print(itemsDeleted.length);
    return itemsDeleted;
  }

  void addMultipleTasks(List<HomeworkItem> it) {
    _items.insertAll(0, it);
    notifyListeners();
  }

  void clearFilter() {
    _listSubj = [];
    notifyListeners();
  }

  List<HomeworkItem> itemsBySubject(String id) {
    return _items.where((element) => element.subjectId == id).toList();
  }

  void addItem(HomeworkItem item, idx) {
    _items.insert(idx, item);
    notifyListeners();
  }

  void remItem(String id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  int triggerComplete(HomeworkItem item, {int idx}) {
    bool itemComp;
    if (idx == null) {
      itemComp = !item.completed;
    } else {
      itemComp = item.completed;
    }
    final itemUpdated = HomeworkItem(
      type: item.type,
      description: item.description,
      dueOn: item.dueOn,
      id: item.id,
      subjectId: item.subjectId,
      title: item.title,
      completed: itemComp,
    );
    if (idx == null) {
      idx = _items.indexOf(item);
    }
    print("index: " + idx.toString());
    _items.remove(item);
    _items.insert(idx, itemUpdated);
    print("completed original: " + item.completed.toString());
    print("completed updated: " + itemUpdated.completed.toString());
    notifyListeners();
    return idx;
  }
}
