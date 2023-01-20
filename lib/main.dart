import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application/screen/UandI/theme_uandi.dart';
import 'package:flutter_application/screen/UandI/u_i_homescreen.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      theme: themeData,
      home: UandIHomescreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
