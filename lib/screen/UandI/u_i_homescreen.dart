import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UandIHomescreen extends StatefulWidget {
  @override
  State<UandIHomescreen> createState() => _UandIHomescreenState();
}

class _UandIHomescreenState extends State<UandIHomescreen> {
  String? _date;
  String? _today;
  String? _dday = "+0";
  DateTime now = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _date = now.year.toString() +
        "." +
        now.month.toString() +
        "." +
        now.day.toString();
    _today = _date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Container(
          color: Colors.pink[100],
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _Top(
                onPressed: onPressedHeart,
                date: _date,
                dday: _dday,
              ),
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }

  onPressedHeart() {
    showCupertinoDialog(
      context: context,
      builder: ((context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (value) {
                setState(() {
                  _date = value.year.toString() +
                      '.' +
                      value.month.toString() +
                      '.' +
                      value.day.toString();

                  _dday = now.difference(value).inDays.toString();
                  if (now.difference(value).inDays.toInt() >= 0) {
                    _dday = "+" + _dday!;
                  }
                });
              },
            ),
          ),
        );
      }),
    );
  }
}

class _Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        "asset/img/test_movie_1.png",
      ),
    );
  }
}

class _Top extends StatelessWidget {
  _Top({required this.onPressed, required this.date, required this.dday});
  VoidCallback onPressed;
  String? date;
  String? dday;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "U&I",
            style: textTheme.headline1,
          ),
          Column(
            children: [
              Text(
                "우리 처음 만난날",
                style: textTheme.headline2,
              ),
              Text(
                date ?? "",
                style: textTheme.bodyText1,
              ),
            ],
          ),
          IconButton(
            iconSize: 50,
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Text(
            "D$dday",
            style: textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
