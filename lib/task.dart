import 'package:flutter/material.dart';

class Task {
  String title;
  bool isDone;
  Task({required this.title, this.isDone = false});
}