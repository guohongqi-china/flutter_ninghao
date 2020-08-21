// import 'dart:html';

import 'package:flutter/material.dart';
import './LayoutItems.dart';

class ImageLayoutPage extends StatefulWidget {
  @override
  _ImageLayoutPageState createState() => _ImageLayoutPageState();
}

class _ImageLayoutPageState extends State<ImageLayoutPage> {
  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(title: Text("9宫格布局，对4处理"));
    Widget content = ListView(
      children: <Widget>[
        Text("九宫格"),
        LayoutItemsPage(
          listData: [1, 2, 3, 3, 4],
          layout: LayoutBounds(
            horizontalSpace: 5.0,
            verticalSapce: 5.0,
          ),
          parentWidth: MediaQuery.of(context).size.width,
          marginLeft: 100.0,
          marginRight: 20.0,
        ),
        Text("九宫格"),
        LayoutItemsPage(
          listData: [1, 2, 3, 3, 4, 6, 7, 8],
          layout: LayoutBounds(
            horizontalSpace: 5.0,
            verticalSapce: 5.0,
          ),
          parentWidth: MediaQuery.of(context).size.width,
          marginLeft: 20.0,
          marginRight: 20.0,
        ),
      ],
    );
    Widget body = Container(
      height: 1600,
      color: Colors.blue,
      child: content,
    );

    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
