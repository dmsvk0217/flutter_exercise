import 'package:flutter/material.dart';
import 'package:flutter_application/screen/videoPlayer/videoPlayer.dart';
import 'package:get/route_manager.dart';

void main(List<String> args) {
  runApp(
    GetMaterialApp(
      home: VideoPlayer(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
