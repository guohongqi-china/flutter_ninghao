import 'package:flutter/material.dart';
import 'requestManager.dart';
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';

class NewDetailInfo extends StatefulWidget {
  Map arguments;
  NewDetailInfo({Key key, this.arguments});
  @override
  _NewDetailInfoState createState() =>
      _NewDetailInfoState(arguments: this.arguments);
}

class _NewDetailInfoState extends State<NewDetailInfo> {
  Map arguments;

  dynamic source;

  _NewDetailInfoState({this.arguments});

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
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    var data = """
    ${this.source == null ? "" : this.source['content']}
    """;
    Widget title = Text('新闻详情');
    Widget body = ListView(
      children: [
        // Text(this.source['title']),
        // Text(this.source['summary']),
        Html(
          data: data,
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: body,
    );
  }
}
