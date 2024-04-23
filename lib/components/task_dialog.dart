import 'package:flutter/material.dart';

class TaskDialog extends StatelessWidget {
  final void Function()? addNewTask;
  final TextEditingController? controller;
  const TaskDialog(
      {super.key, required this.addNewTask, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Tambah Data"),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Masukkan Tugas",
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
          onPressed: addNewTask,
          child: Text("Tambahkan"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Tutup"),
        ),
      ],
    );
  }
}
