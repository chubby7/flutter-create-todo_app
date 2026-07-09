import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'task.dart';

class TaskData extends ChangeNotifier{
  final Box<Task> _taskBox = Hive.box<Task>('tasks');
  List<Task> get tasks => _taskBox.values.toList() ;

  void addTask(String title){
    _taskBox.add(Task(title: title));
    notifyListeners();
  }

  void toggleTask(Task task, bool value){
    task.isDone = value;
    task.save();
    notifyListeners();
  }

  void deleteTask(Task task){
    task.delete();
    notifyListeners();
  }
}