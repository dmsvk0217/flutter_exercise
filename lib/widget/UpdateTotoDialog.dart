import 'package:flutter/material.dart';
import 'package:flutter_application/controller/todo_controller.dart';
import 'package:flutter_application/domain/todo/todo.dart';
import 'package:flutter_application/widget/custom_alert_dialog.dart';
import 'package:get/get.dart';

class UpdateTotoDialog extends StatefulWidget {
  final todo;
  UpdateTotoDialog({required this.todo});

  @override
  State<UpdateTotoDialog> createState() => _UpdateTotoDialogState();
}

class _UpdateTotoDialogState extends State<UpdateTotoDialog> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  TodoController _todoController = Get.put(TodoController());
  late Todo todo;

  @override
  void initState() {
    super.initState();
    setState(() {
      todo = widget.todo;
      _titleController.text = todo.title!;
      print("onInitonInitonInit");
      print(todo.title);
      print(todo.content);
      _contentController.text = todo.content!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Column(
          children: [
            TextField(
              controller: _titleController,
            ),
            TextField(
              controller: _contentController,
            ),
            TextButton(
                onPressed: () async {
                  Todo newtodo = Todo(
                      title: _titleController.text,
                      content: _contentController.text);
                  int result =
                      await _todoController.updateById(newtodo, todo.id!);
                  if (result == 1) {
                    return Get.back();
                  }
                  return CustomAlertDialog(
                      context, "업데이트 실패", "업데이트 과정 중 오류가 발생했습니다.");
                },
                child: Text("업데이트 하기"))
          ],
        ),
      ),
    );
  }
}
