import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/model/model_todo.dart';
import 'package:get/get.dart';

class createWidget extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

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
            onPressed: () {
              Map<String, dynamic> newTodo =
                  new Todo(_titleController.text, _contentController.text)
                      .toMap();
              FirebaseFirestore.instance
                  .collection("todo")
                  .add(newTodo)
                  .whenComplete(() {
                Get.back();
              });
            },
            child: Text("등록하기"),
          ),
        )
      ],
    );
  }
}
