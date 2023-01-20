import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application/screen/random_number/colors.dart';

class RandomHomescreen extends StatefulWidget {
  const RandomHomescreen({super.key});

  @override
  State<RandomHomescreen> createState() => _RandomHomescreenState();
}

class _RandomHomescreenState extends State<RandomHomescreen> {
  List<int> randomNumber = [123, 456, 789];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          color: primary_color,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _top(),
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
      temp.add(rand.nextInt(3));
    }
    setState(() {
      randomNumber = temp.toList();
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
                child: Row(
                  children: x.value
                      .toString()
                      .split("")
                      .map(
                        (e) => Image.asset(
                          "asset/img/$e.png",
                          height: 60,
                        ),
                      )
                      .toList(),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _top extends StatelessWidget {
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
        Icon(
          Icons.settings,
          color: red_color,
        ),
      ],
    );
  }
}
