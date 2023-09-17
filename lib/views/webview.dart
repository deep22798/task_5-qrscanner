import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webview extends StatefulWidget {
  String uri;
   webview({super.key,required this.uri});

  @override
  State<webview> createState() => _webviewState();
}

class _webviewState extends State<webview> {
  final _key = UniqueKey();
  bool isLoading=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            WebView(
              key: _key,
              initialUrl: widget.uri,
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            isLoading ? Center( child: CircularProgressIndicator(backgroundColor: Colors.teal, color: Colors.white,),)
                : Stack(),
          ],
        ),
      ),
    );
  }
}
