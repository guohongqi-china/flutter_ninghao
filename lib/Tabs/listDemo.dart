import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表演示"),
      ),
      body: ListView(
        children: <Widget>[
          demoItem(
            "普通列表",
            () {
              Navigator.pushNamed(context, "/listone");
            },
            marginTop: 20.0,
          ),
          demoItem(
            "卡片列表",
            () {
              Navigator.pushNamed(context, "/listtwo");
            },
            marginTop: 20.0,
          ),
          demoItem(
            "普通列表",
            () {
              Navigator.pushNamed(context, "/listcard");
            },
            marginTop: 20.0,
          )
        ],
      ),
    );
  }
}

class demoItem extends StatelessWidget {
  final marginTop;
  final height;
  final title;
  Function callBack;

  demoItem(this.title, this.callBack, {this.marginTop = 0, this.height = 30.0})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      margin: EdgeInsets.fromLTRB(10, marginTop, 10, 0),
      height: height,
      child: FlatButton(onPressed: callBack, child: Text(this.title)),
    );
  }
}
