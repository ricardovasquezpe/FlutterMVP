import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;

    WebViewController _webViewController;

    final Completer<WebViewController> _controller =
    Completer<WebViewController>();

    _controller.future.then((controller) {
      _webViewController = controller;
      Map<String, String> header = {'Cookie': 'ASP.NET_SessionId=ffeefe'};
      _webViewController.loadUrl('https://www.nasa.gov', headers: header);
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: 600,
            child: WebView(
              initialUrl: 'https://www.nasa.gov',
              debuggingEnabled: true,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onPageFinished: (String value) {
                setSession("323", _webViewController);
              }
            )
        ),
      ),
    );
  }

  void setSession(String sessionId, WebViewController webViewController) async {
    if (Platform.isIOS) {
      await webViewController.evaluateJavascript("document.cookie = 'ASP.NET_SessionId=$sessionId'");
    } else {
      await webViewController.evaluateJavascript('document.cookie = "ASP.NET_SessionId=$sessionId; path=/"');
    }
  }
}