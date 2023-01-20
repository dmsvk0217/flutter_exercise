import 'package:flutter/material.dart';
import 'package:flutter_application/screen/stateful_and_webview/stateful_test.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController? controller;
  String _homeUrl = "https://dmsvk01.tistory.com/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dmsvk0217"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () async {
            if (controller == null) return;
            return await controller!.loadUrl(_homeUrl);
          },
        ),
        actions: [
          Icon(Icons.wallet),
        ],
      ),
      body: SafeArea(
        child: WebView(
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
          initialUrl: _homeUrl,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
