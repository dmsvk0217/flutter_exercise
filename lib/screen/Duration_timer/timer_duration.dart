import 'dart:async';

import 'package:flutter/material.dart';

class TimerHomeScreen extends StatefulWidget {
  @override
  State<TimerHomeScreen> createState() => _TimerHomeScreenState();
}

class _TimerHomeScreenState extends State<TimerHomeScreen> {
  DateTime date = DateTime.now();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print("timer");
      setState(() {
        date = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(date.toString()),
        ),
      ),
    );
  }
}
