import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: renderEmpty(),
    );
  }

  renderEmpty() {
    return Container(
      decoration: _boxDecoration(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Logo(
              onTap: onLogoTap,
            ),
            SizedBox(height: 30),
            AppName(),
          ],
        ),
      ),
    );
  }

  void onLogoTap() {
    var video = ImagePicker().pickVideo(source: ImageSource.gallery);
    print("lll");
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFF354381),
          Color(0xFF020316),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}

Widget AppName() {
  final textStyle = TextStyle(color: Colors.white, fontSize: 30);

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "VIDEO",
        style: textStyle,
      ),
      Text(
        "PLAYER",
        style: textStyle.copyWith(fontWeight: FontWeight.bold),
      ),
    ],
  );
}

class _Logo extends StatelessWidget {
  final VoidCallback onTap;
  const _Logo({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset("asset/img/logo.png"),
    );
  }
}
