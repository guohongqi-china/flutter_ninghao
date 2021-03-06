import 'package:flutter/material.dart';
import '../Pages/DemoPage/requestManager.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class ListPage extends StatelessWidget {
  void _getRequestFuncation() async {
    print("object");
    // Dio dio = Dio();
    // String url = "http://127.0.0.1:8000/listData/count";
    FormData formData = FormData.fromMap({"name": "张三", "age": 22});

    ///发起 post 请求 如这里的注册用户信息
    //   Response response = await dio.post(url, data: formData);
    //   String result = response.data.toString();
    //   print(result);
    //   setState(() {
    //     loadingState = false;
    //  });

    RequestManager.request(
        Method.POST, "http://127.0.0.1:8000/listData/count", {"age": 22},
        success: (data) => {
              print("$data"),
              // this.listData = json.decode(data),
              // this.str = listData['data']['name'],
              // print(this.listData),
              // setState(() {
              //     loadingState = false;
              // })
            },
        fail: (code, message) => {
              // setState(() {
              //   loadingState = false;
              //  })
            });
  }

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
          ),
          demoItem(
            "Post请求",
            () {
              _getRequestFuncation();
              // Navigator.pushNamed(context, "/network");
            },
            marginTop: 20.0,
          ),
          demoItem(
            "网络请求",
            () {
              Navigator.pushNamed(context, "/network");
            },
            marginTop: 20.0,
          ),
          demoItem(
            "上拉刷新下拉加载",
            () {
              Navigator.pushNamed(context, "/tableview");
            },
            marginTop: 20.0,
          ),
          demoItem(
            "FPS优化",
            () {
              Navigator.pushNamed(context, "/fpspage");
            },
            marginTop: 20.0,
          ),
          demoItem(
            "9宫格布局对4处理",
            () {
              Navigator.pushNamed(context, "/imagelayout");
            },
            marginTop: 20.0,
          ),
          demoItem(
            "GridView",
            () {
              Navigator.pushNamed(context, "/gridview");
            },
            marginTop: 20.0,
          ),
          demoItem(
            "新闻列表",
            () {
              Navigator.pushNamed(context, "/neewlist",
                  arguments: {'1': '2222'});
            },
            marginTop: 20.0,
          ),
          demoItem(
            "传参",
            () {
              Navigator.pushNamed(context, '/productinfo',
                  arguments: {"pid": '12312432'});
            },
            marginTop: 20.0,
          ),
          demoItem(
            "flutter 与 原生交互",
            () {
              Navigator.pushNamed(context, '/native');
            },
            marginTop: 20.0,
          ),
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
