import 'package:flutter/material.dart';
import 'package:flutter_application/widget/test.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(
    GetMaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatelessWidget {
  goToNext() {
    Get.to(GetXStateTest());
  }

  _showSnackBar() {
    Get.snackbar(
      "Hey There",
      "Snackbar is easy",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  _showDialog() {
    Get.defaultDialog(
      title: "Simple Dialog",
      content: Text("Too Ea"),
    );
  }

  _showBottomSheet() {
    Get.bottomSheet(
      Container(
        child: Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Music'),
                onTap: () => {}),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Video'),
              onTap: () => {},
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Package | Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("Go To Second"),
              onPressed: () => goToNext(),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: Text("_showSnackBar"),
              onPressed: () {
                _showSnackBar();
              },
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: Text("_showDialog"),
              onPressed: () {
                _showDialog();
              },
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: Text("_showBottomSheet"),
              onPressed: () {
                _showBottomSheet();
              },
            )
          ],
        ),
      ),
    );
  }
}
