import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: Row(
        children: [
          SizedBox(
            height: 50.0,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/register");
            },
            child: Text("登陆跳转"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/register");
            },
            child: Text("登陆跳转"),
          )
        ],
      ),
    );
  }
}
