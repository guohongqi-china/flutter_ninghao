import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'requestManager.dart';
import 'dart:convert';

class WebViewPage extends StatefulWidget {
  Map arguments;
  WebViewPage({Key key, this.arguments});
  @override
  _WebViewPageState createState() =>
      _WebViewPageState(arguments: this.arguments);
}

class _WebViewPageState extends State<WebViewPage> {
  Map arguments;
  _WebViewPageState({Key key, this.arguments});

  dynamic source;

  _getData() {
    var api =
        'http://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${this.arguments['pid']}';
    RequestManager.request(Method.GET, api, null, success: (data) {
      dynamic source = jsonDecode(data);
      setState(() {
        this.source = source['result'][0];
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getData();
    print(
        'http://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${this.arguments['pid']}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('333333333'),
      ),
      body: WebView(
        initialUrl:
            'http://www.phonegap100.com/newscontent.php?aid=${this.arguments['pid']}',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
