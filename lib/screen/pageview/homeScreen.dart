import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageViewHomeScreen extends StatefulWidget {
  @override
  State<PageViewHomeScreen> createState() => _PageViewHomeScreenState();
}

class _PageViewHomeScreenState extends State<PageViewHomeScreen> {
  Timer? timer;
  PageController _controller = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), ((timer) {
      print("timer");
      int currentPage = _controller.page!.toInt();
      int nextPage = currentPage + 1;
      if (nextPage == 5) nextPage = 0;
      _controller.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    }));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    if (timer != null) {
      timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: Container(
        child: PageView(
          controller: _controller,
          children: [1, 2, 3, 4, 5]
              .map((e) =>
                  Image.asset("asset/img/image_$e.jpeg", fit: BoxFit.cover))
              .toList(),
        ),
      ),
    );
  }
}
