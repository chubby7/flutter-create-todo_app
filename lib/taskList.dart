import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  TasksList({required this.title, required this.isChecked});
  String title;
  bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(15),
      ),

      child: ListTile(
        leading: Checkbox(value: isChecked, onChanged: (value) {}),
        title: Text(title, style: TextStyle(color: Colors.white)),
        trailing: Icon(Icons.delete, color: Colors.red),
      ),
    );
  }
}