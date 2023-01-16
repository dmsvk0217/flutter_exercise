import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController controller = TextEditingController();
  String inputText = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          padding: EdgeInsets.all(30),
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/netflix_logo.png'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 15),
              child: Text(
                '최은총',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  width: 120,
                  height: 5,
                  color: Colors.red,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  width: 120,
                  height: 5,
                  color: Colors.blue,
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: Linkify(
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                text: "https://github.com/dmsvk0217",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                linkStyle: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {},
                child: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '프로필 수정하기',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(inputText),
            TextField(
              controller: controller,
              onChanged: (text) {
                setState(() {
                  //inputText = controller.text;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  inputText = controller.text;
                });
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
