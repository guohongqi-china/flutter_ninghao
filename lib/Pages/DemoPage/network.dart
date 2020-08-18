import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:convert';
import './requestManager.dart';


 Dio dio;

 /// 创建 dio 实例对象
 Dio createInstance() {
    if (dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 15000,
        responseType: ResponseType.plain,
        validateStatus: (status) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        baseUrl: "http://poetry.huhustory.com/",
      );

      dio = new Dio(options);
    }

    return dio;
  }



class NetworkPage extends StatefulWidget {
  @override
  _NetworkPageState createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {

var loadingState=false;
var listData;
var str;

void _pressAction(){
  print("222");
}
   
 void _getRequestFuncation() async{
   setState(() {
     loadingState = true;
   });
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

   RequestManager.request(Method.POST, "http://127.0.0.1:8000/listData/count1", formData,success: (data)=>{
          print("$data"),
          this.listData = json.decode(data),
          this.str = listData['data']['name'],
          print(this.listData),
          setState(() {
              loadingState = false;
          })
   },fail: (code,message)=>{
    setState(() {
      loadingState = false;
     })
   });

 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络请求"),
      ),
      body: ListView(
        children: <Widget>[
           Container(
              color: Colors.orange,
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              height: 30.0,
              child: FlatButton(onPressed: _getRequestFuncation, 
              child: Text("post")),
           ),
           Container(
              color: Colors.orange,
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              height: 30.0,
              child: FlatButton(onPressed: _pressAction, 
              child: Text("p333333ost")),
           ),
           loadingState ? Text('网络请求中') : Text('请求完毕' + '$str'),
        ],
      ),
    );
  }
}