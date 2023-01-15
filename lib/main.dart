import 'package:flutter/material.dart';
import 'package:flutter_application/screen/home_screen.dart';
import 'package:flutter_application/widget/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TabController contorller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflex',
      theme: ThemeData(
        // brightness: Brightness.dark,
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent),
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              Container(
                child: Center(child: Text('search')),
              ),
              Container(
                child: Center(child: Text('save')),
              ),
              Container(
                child: Center(child: Text('more')),
              ),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
