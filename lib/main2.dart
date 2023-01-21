import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/screen/crud_screen.dart';
import 'package:flutter_application/screen/home_screen.dart';
import 'package:flutter_application/screen/like_screen.dart';
import 'package:flutter_application/screen/profile.dart';
import 'package:flutter_application/screen/search_screen.dart';
import 'package:flutter_application/widget/bottom_bar.dart';
import 'package:flutter_application/widget/test.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TabController contorller;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflex',
      theme: ThemeData(
        // brightness: Brightness.dark,
        backgroundColor: Colors.black,
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent),
      ),
      home: DefaultTabController(
        length: 4,
        initialIndex: 3,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              SearchScreen(),
              SearchScreen(),
              CrudScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
