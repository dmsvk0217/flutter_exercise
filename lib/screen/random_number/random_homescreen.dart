import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application/screen/random_number/colors.dart';
import 'package:flutter_application/screen/random_number/number_row.dart';
import 'package:flutter_application/screen/random_number/setting_screen.dart';
import 'package:get/get.dart';

class RandomHomescreen extends StatefulWidget {
  const RandomHomescreen({super.key});

  @override
  State<RandomHomescreen> createState() => _RandomHomescreenState();
}

class _RandomHomescreenState extends State<RandomHomescreen> {
  List<int> randomNumber = [];
  int targetNumber = 1000;

  @override
  void initState() {
    super.initState();
    randomNumber = [123, 456, 789];
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (Get.arguments != null) {
        targetNumber = Get.arguments.result;
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          color: primary_color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _top(targetNumber, setTargetNumber),
              _buildRandomNumber(randomNumber),
              _button(pushButton),
            ],
          ),
        ),
      ),
    );
  }

  void pushButton() {
    final rand = Random();
    Set<int> temp = {};
    while (temp.length != 3) {
      temp.add(rand.nextInt(targetNumber));
    }
    setState(() {
      randomNumber = temp.toList();
    });
  }

  void setTargetNumber(int target) {
    setState(() {
      targetNumber = target;
    });
  }
}

class _button extends StatelessWidget {
  final VoidCallback onPressed;
  _button(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: red_color),
        onPressed: onPressed,
        child: Text(
          "생성하기",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _buildRandomNumber extends StatelessWidget {
  final List<int> randomNumber;
  _buildRandomNumber(this.randomNumber);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: randomNumber
            .asMap()
            .entries
            .map(
              (x) => Padding(
                  padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 16),
                  child: NumberRow(targetNumber: x.value)),
            )
            .toList(),
      ),
    );
  }
}

class _top extends StatelessWidget {
  final targetNumber;
  final setTargetNumber;
  _top(this.targetNumber, this.setTargetNumber);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "랜덤숫자 생성기",
            style: TextStyle(
                color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
            icon: Icon(Icons.settings),
            color: red_color,
            onPressed: () async {
              await Get.to(() => SettingScreen(),
                      arguments: targetNumber,
                      transition: Transition.rightToLeft)!
                  .then((result) {
                setTargetNumber(result[0]["targetNumber"]);
              });
            }),
      ],
    );
  }
}
