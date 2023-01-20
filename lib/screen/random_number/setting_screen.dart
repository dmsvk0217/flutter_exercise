import 'package:flutter/material.dart';
import 'package:flutter_application/screen/random_number/colors.dart';
import 'package:flutter_application/screen/random_number/number_row.dart';
import 'package:flutter_application/screen/random_number/random_homescreen.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int targetNumber = 10000;

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      targetNumber = Get.arguments;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primary_color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: NumberRow(targetNumber: targetNumber),
              ),
              _Footer(
                targetNumber: targetNumber,
                onSliderChanged: onSliderChanged,
                onButtonChanged: onButtonChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onButtonChanged(value) {
    setState(() {
      targetNumber = value.toInt();
    });
  }

  onSliderChanged() {
    return Get.back(result: [
      {"targetNumber": targetNumber}
    ]);
    // Get.off(RandomHomescreen(),
    //     arguments: targetNumber, transition: Transition.leftToRightWithFade);
  }
}

class _Footer extends StatelessWidget {
  int targetNumber;
  VoidCallback onSliderChanged;
  ValueChanged<double> onButtonChanged;
  _Footer({
    required this.targetNumber,
    required this.onSliderChanged,
    required this.onButtonChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
          value: targetNumber.toDouble(),
          min: 1000,
          max: 100000,
          onChanged: onButtonChanged,
        ),
        ElevatedButton(
          onPressed: onSliderChanged,
          child: Text("저장!"),
          style: ElevatedButton.styleFrom(backgroundColor: red_color),
        )
      ],
    );
  }
}
