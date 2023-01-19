import 'package:flutter/material.dart';
import 'package:flutter_application/controller/todo_controller.dart';
import 'package:flutter_application/domain/todo/todo.dart';
import 'package:get/get.dart';

class createWidget extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TodoController _todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Column(
          children: [
            Text("Todo 등록하기"),
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
            onPressed: () async {
              Todo newTodo = new Todo(
                  title: _titleController.text,
                  content: _contentController.text,
                  done: false);
              int result = await _todoController.create(newTodo);
              if (result == 1) {
                Get.back();
              } else {
                print("[_todoController.create] 오류 발생");
              }
            },
            child: Text("등록하기"),
          ),
        )
      ],
    );
  }
}
