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

class ResultData {
  var data;
  bool isSuccess;
  int code;
  var headers;

  ResultData(this.data, this.isSuccess, this.code, {this.headers});
}

class RequestInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    Map<String, dynamic> headers = options.headers;
    print("发起请求之前处理结果");
    headers["token"] = "00000000000";
    return options;
  }

  @override
  Future onResponse(Response response) async {
    RequestOptions option = response.request;
    try {
      if (option.contentType != null && option.contentType.contains("text")) {
        return new ResultData(response.data, true, 200);
      }

      ///一般只需要处理200的情况，300、400、500保留错误信息，外层为http协议定义的响应码
      if (response.statusCode == 200 || response.statusCode == 201) {
        ///内层需要根据公司实际返回结构解析，一般会有code，data，msg字段
        int code = response.data["code"];
        if (code == 0) {
          return new ResultData(response.data, true, 200,
              headers: response.headers);
        } else {
          return new ResultData(response.data, false, 200,
              headers: response.headers);
        }
      }
    } catch (e) {
      print(e.toString() + option.path);

      return new ResultData(response.data, false, response.statusCode,
          headers: response.headers);
    }

    return new ResultData(response.data, false, response.statusCode,
        headers: response.headers);
  }
}

class NetworkPage extends StatefulWidget {
  @override
  _NetworkPageState createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  var loadingState = false;
  var listData;
  var str;

  void _pressAction() {
    print("222");
  }

  void _getRequestFuncation() async {
    setState(() {
      loadingState = true;
    });
    print("object");
    Dio dio = Dio();
    String url = "http://127.0.0.1:8000/listData/count";
    FormData formData = FormData.fromMap({"name": "张三", "age": 22});
    //发起 post 请求 如这里的注册用户信息
    // Response response = await dio.post(url, data: {"name": "张三", "age": 22});
    Response response = await dio.post(url, data: formData);
    String result = response.data.toString();
    print(result);
    setState(() {
      loadingState = false;
    });
  }

  Future _postNodeJSServer() async {
    setState(() {
      loadingState = true;
    });

    try {} catch (e) {}

    try {
      Dio dio = Dio();
      dio.interceptors.add(RequestInterceptor());
      String url = "http://127.0.0.1:8000/listData/count";
      FormData formData = FormData.fromMap({"name": "张三", "age": 22});
      //发起 post 请求 如这里的注册用户信息
      print("开始发起请求");
      Response response = await dio.post(url, data: {"name": "张三", "age": 22});
      String result = response.data.toString();
      print(result);
      print("===++===响应头${response.headers}");
      print("======响应码${response.statusCode}");
      print("======出错${response.statusMessage}");
      print("======响应体body${response.data}");
      setState(() {
        loadingState = false;
      });
    } on DioError catch (error) {
      DioError err = error;
      RequestOptions request = err.request;
      Response response = err.response;
      var dataErroe = err.error;

      print("======出错$error");
      print("======响应头${response.headers}");
      print("======响应码${response.statusCode}");
      print("======出错${response.statusMessage}");
      print("======出错body${response.data}");
      print("======出错error${dataErroe}");
    } catch (e) {
      print("======出错888$e");
      setState(() {
        loadingState = false;
      });
    }
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
            child:
                FlatButton(onPressed: _postNodeJSServer, child: Text("post12")),
          ),
          Container(
            color: Colors.orange,
            margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
            height: 30.0,
            child: FlatButton(
                onPressed: _postNodeJSServer, child: Text("p333333ost")),
          ),
          loadingState ? Text('网络请求中') : Text('请求完毕' + '$str'),
        ],
      ),
    );
  }
}
