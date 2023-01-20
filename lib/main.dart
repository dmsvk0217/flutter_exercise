import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application/screen/random_number/random_homescreen.dart';
import 'package:get/route_manager.dart';

void main(List<String> args) {
  runApp(
    GetMaterialApp(
      home: RandomHomescreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
