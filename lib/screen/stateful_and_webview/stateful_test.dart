import 'package:flutter/material.dart';
import 'package:flutter_application/screen/stateful_and_webview/StatefulTestInner.dart';

class StatefulTest extends StatefulWidget {
  const StatefulTest({super.key});

  @override
  State<StatefulTest> createState() {
    print("createState 실행!");
    return _StatefulTestState();
  }
}

class _StatefulTestState extends State<StatefulTest> {
  String _text = "";
  TextEditingController _textController = TextEditingController();

  void textHandler(value) {
    setState(() {
      _text = _textController.text;
    });
  }

  @override
  void initState() {
    super.initState();
    print("initState 실행!");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies 실행!");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate 실행!");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose 실행!");
  }

  @override
  void didUpdateWidget(covariant StatefulTest oldWidget) {
    print("didUpdateWidget 실행!");
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print("build 실행!");
    return Container(
        color: Colors.yellow,
        child: Column(
          children: [
            TextField(
              controller: _textController,
              onChanged: textHandler,
            ),
            Text(_textController.text),
            StatefulTestInner(_text, Colors.blue),
          ],
        ));
  }
}
