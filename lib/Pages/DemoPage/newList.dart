import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'dart:async';
import 'dart:convert';
import './requestManager.dart';

class NewListPage extends StatefulWidget {
  Map arguments;
  NewListPage(this.arguments);

  @override
  _NewListPageState createState() => _NewListPageState();
}

class _NewListPageState extends State<NewListPage> {
  List dataList = [];

  @override
  void initState() {
    _getNewsList();
  }

  _getNewsList() {
    RequestManager.request(
        Method.GET,
        "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1",
        null, success: (data) {
      setState(() {
        dynamic ui = jsonDecode(data);
        this.dataList = ui['result'];
      });
    }, fail: (code, message) {});
  }

  Function hiddenTap(int index) {
    return () {
      Navigator.pushNamed(context, '/webview',
          arguments: {"pid": this.dataList[index]['aid']});
    };
  }

  Widget _buildWidget(context, index) {
    var data = this.dataList[index];
    return ListTile(
      title: Text(data['title']),
      onTap: hiddenTap(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    var content = ListView.builder(
      itemBuilder: _buildWidget,
      itemCount: this.dataList.length,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('新闻列表'),
      ),
      body: content,
    );
  }
}
