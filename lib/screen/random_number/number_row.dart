import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  final targetNumber;
  const NumberRow({required this.targetNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: targetNumber
          .toString()
          .split("")
          .map(
            (e) => Image.asset(
              "asset/img/$e.png",
              height: 60,
            ),
          )
          .toList(),
    );
  }
}
