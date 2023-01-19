import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> CustomAlertDialog(
    BuildContext context, String title, String content) {
  return showDialog(
      context: context,
      //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          //Dialog Main Title
          title: Column(
            children: <Widget>[
              new Text(title),
            ],
          ),
          //
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                content,
              ),
            ],
          ),
          actions: <Widget>[
            new TextButton(
              child: new Text("확인"),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      });
}
