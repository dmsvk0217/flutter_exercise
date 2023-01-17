import 'package:flutter/material.dart';
import 'package:flutter_application/model/model_todo.dart';

class UpdateWidget extends StatefulWidget {
  final todo;
  UpdateWidget({required this.todo});

  @override
  State<UpdateWidget> createState() => _UpdateWidgetState();
}

class _UpdateWidgetState extends State<UpdateWidget> {
  late String _title;
  late String _content;

  @override
  void initState() {
    super.initState();
    setState(() {
      _title = widget.todo.title + 'test';
      _content = widget.todo.content + 'test';
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Column(
          children: [
            Text(_title!),
            Text(_content!),
          ],
        ),
      ),
    );
  }
}
