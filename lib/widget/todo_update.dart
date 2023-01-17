import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/model/model_todo.dart';
import 'package:get/get.dart';

class UpdateWidget extends StatefulWidget {
  Todo todo;
  UpdateWidget({required this.todo});

  @override
  State<UpdateWidget> createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.todo.title;
    _contentController.text = widget.todo.content;
  }

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
              Map<String, dynamic> newTodo = new Todo(_titleController.text,
                      _contentController.text, widget.todo.done)
                  .toMap();
              print(newTodo);
              widget.todo.reference
                  ?.update(newTodo)
                  .whenComplete(() => Get.back());
            },
            child: Text("수정하기"),
          ),
        )
      ],
    );
  }
}
