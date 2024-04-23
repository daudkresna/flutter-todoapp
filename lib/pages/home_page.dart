import 'package:flutter/material.dart';
import 'package:todo_app/components/task_dialog.dart';
import 'package:todo_app/components/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  List toDoList = [
    ["Memasak Nasi", false],
    ["Cuci Baju", true],
    ["Cuci Baju", true],
    ["Cuci Baju", true],
    ["Cuci Baju", true],
    ["Cuci Baju", true],
    ["Cuci Baju", true],
    ["Memasak Nasi", false],
    ["Memasak Nasi", false],
  ];

  void changeCheckbox(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void deleteTask(index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  void addNewTask() {
    setState(
      () {
        toDoList.add([myController.text, false]);
        myController.clear();
        Navigator.of(context).pop();
      },
    );
  }

  void dialogTask() {
    showDialog(
      context: context,
      builder: (context) {
        return TaskDialog(
          addNewTask: addNewTask,
          controller: myController,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.inversePrimary,
      appBar: AppBar(
        title: Text("Todo App"),
        centerTitle: true,
        backgroundColor: theme.colorScheme.inversePrimary,
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: dialogTask,
        backgroundColor: theme.colorScheme.primaryContainer,
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return TodoList(
              value: toDoList[index][1],
              onChanged: (value) {
                changeCheckbox(value, index);
              },
              text: toDoList[index][0],
              deleteTask: () {
                deleteTask(index);
              },
            );
          },
        ),
      ),
    );
  }
}
