import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application/screen/Duration_timer/timer_duration.dart';
import 'package:flutter_application/screen/UandI/u_i_homescreen.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'nanum',
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 50,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 50,
          ),
        ),
      ),
      home: UandIHomescreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
