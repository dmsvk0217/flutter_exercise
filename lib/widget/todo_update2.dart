import 'package:flutter/material.dart';
import 'package:flutter_application/model/model_todo.dart';
import 'package:get/get.dart';

class UpdateWidget2 extends StatelessWidget {
  Todo todo;
  UpdateWidget2({required this.todo});

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Column(
          children: [
            Text("Todo 수정하기"),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'title'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'content'),
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () {
              Map<String, dynamic> newTodo = new Todo(
                      _titleController.text, _contentController.text, todo.done)
                  .toMap();
              print(newTodo);
              todo.reference?.update(newTodo).whenComplete(() => Get.back());
            },
            child: Text("수정하기"),
          ),
        )
      ],
    );
  }
}
