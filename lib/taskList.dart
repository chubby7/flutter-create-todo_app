import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.title,
    required this.isChecked,
    required this.onChanged,
    required this.onDelete,
  });

  final String title;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(15),
      ),

      child: ListTile(
        leading: Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
        title: Text(title, style: TextStyle(color: Colors.white)),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
      onPressed: onDelete,
    ),
      ),
    );
  }
}