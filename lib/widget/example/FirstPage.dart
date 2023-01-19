import 'package:flutter/material.dart';
import 'package:flutter_application/controller/count_controller_with_getx.dart';
import 'package:get/get.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final controller = Get.put(CountControllerWithGetx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Get.back(),
                child: Text("Back to Page"),
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
      ),
    );
  }
}
