import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application/screen/random_number/random_homescreen.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: RandomHomescreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
