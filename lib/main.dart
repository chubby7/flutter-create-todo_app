import 'package:flutter/material.dart';
import 'package:todoapp/InputPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/task.dart';
import 'package:provider/provider.dart';
import 'taskData.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox<Task>('tasks');

  runApp(ChangeNotifierProvider(create: (context) => TaskData(),
     child: const TodoApp())
      );
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
       home: InputPage(),
    );
  }
}





