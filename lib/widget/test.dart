import 'package:flutter/material.dart';
import 'package:flutter_application/widget/controller/count_controller_with_getx.dart';
import 'package:get/get.dart';

class GetXState extends StatefulWidget {
  @override
  State<GetXState> createState() => _GetXStateState();
}

class _GetXStateState extends State<GetXState> {
  final controller = Get.put(CountControllerWithGetx());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(children: [
          Obx(() => Text(controller.count.toString())),
          TextButton(
            onPressed: () {
              controller.increase();
            },
            child: Text("+"),
          ),
        ]),
      ),
    );
  }
}
