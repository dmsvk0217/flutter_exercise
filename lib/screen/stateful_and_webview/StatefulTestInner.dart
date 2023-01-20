import 'package:flutter/material.dart';

class StatefulTestInner extends StatefulWidget {
  final String text;
  final MaterialColor color;
  StatefulTestInner(this.text, this.color);

  @override
  State<StatefulTestInner> createState() {
    // print("StatefulTestInner createState 실행!");
    return _StatefulTestInnerState();
  }
}

class _StatefulTestInnerState extends State<StatefulTestInner> {
  @override
  Widget build(BuildContext context) {
    // print("StatefulTestInner build 실행!");
    return Container(
      height: 50,
      color: widget.color,
      child: widget.text == null ? Container() : Text(widget.text!),
    );
  }
}

// class StatefulTestInner extends StatelessWidget {
//   final String text;
//   final MaterialColor color;
//   StatefulTestInner(this.text, this.color);

//   @override
//   Widget build(BuildContext context) {
//     print("StatefulTestInner build 실행!");
//     return Container(
//       height: 50,
//       color: color,
//       child: text == null ? Container() : Text(text!),
//     );
//   }
// }
