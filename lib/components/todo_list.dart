import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  final String text;
  final void Function()? deleteTask;

  const TodoList(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.text,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: Checkbox(value: value, onChanged: onChanged),
        trailing: IconButton(onPressed: deleteTask, icon: Icon(Icons.delete)),
        tileColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          text,
          style: TextStyle(
              decoration:
                  value ? TextDecoration.lineThrough : TextDecoration.none),
        ),
      ),
    );
  }
}
