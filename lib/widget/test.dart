import 'package:flutter/material.dart';
import 'package:flutter_application/controller/count_controller_with_getx.dart';
import 'package:flutter_application/widget/example/FirstPage.dart';
import 'package:flutter_application/widget/example/SecondPage.dart';
import 'package:get/get.dart';

class GetXStateTest extends StatefulWidget {
  @override
  State<GetXStateTest> createState() => _GetXStateTestState();
}

class _GetXStateTestState extends State<GetXStateTest> {
  final controller = Get.put(CountControllerWithGetx());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Get.to(FirstPage()),
              child: Text("to firstpage"),
            ),
            TextButton(
              onPressed: () => Get.to(SecondPage()),
              child: Text("to SecondPage"),
            ),
            Obx(() => Text(controller.count.toString())),
            TextButton(
              onPressed: () {
                controller.increase();
              },
              child: Text("+"),
            ),
          ],
        ),
      ),
    );
  }
}
