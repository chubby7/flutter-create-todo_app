import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/task.dart';
import 'constants.dart';
import 'taskList.dart';
import 'package:intl/intl.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'taskData.dart';
import 'package:provider/provider.dart';


class InputPage extends StatefulWidget {
  const InputPage({super.key});


  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  DateTime today = DateTime.now();
  TextEditingController taskController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    taskController.dispose();
  }

  late final taskData = context.watch<TaskData>();

  @override
  Widget build(BuildContext context) {
    int completedTasks = taskData.tasks.where((task) => task.isDone).length;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: Color(0xFF0B132B),
                border: Border.all(width: 0.3, color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Todo Done',
                          style: TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              '$completedTasks/${taskData.tasks.length}',
                              style: TextStyle(
                                color: Color(0xFF0B132B),
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(DateFormat('EEEE, d MMMM y').format(DateTime.now()), style: kNormalTextStyle),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: taskController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Input a new task',
                        filled: true,
                        fillColor: Colors.grey.shade900,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  IconButton(
                    icon: Icon(Icons.add_circle, size: 50),
                    onPressed: () {
                      if (taskController.text.trim().isEmpty) return;
                      context.read<TaskData>().addTask(taskController.text);
                      taskController.clear();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5,
              ),
              child: Text('Tasks', style: kNormalTextStyle),
            ),
            Expanded(child: ListView.builder(
                itemCount: taskData.tasks.length,
                itemBuilder: (context, index){
                  return  TasksList(
                    title: taskData.tasks[index].title,
                    isChecked: taskData.tasks[index].isDone,
                    onChanged: (value) {
                      context.read<TaskData>().toggleTask(
                          taskData.tasks[index], value!);
                    },
                      onDelete: () {
                        context.read<TaskData>().deleteTask(
                          taskData.tasks[index],
                        );
                      },
                  );
                })),
          ],
        ),
      ),
    );
  }
}


