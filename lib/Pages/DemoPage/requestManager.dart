import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'error_handle.dart';
import 'log_utils.dart';
// import 'package:exchange_flutter/common/net/code.dart';
// import 'package:flutter/material.dart';


typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);


class RequestManager{

  static Dio _dioRequest;

  static Dio createInstance(){
    if(_dioRequest == null){

        // 全局属性：
        BaseOptions options = BaseOptions(
          baseUrl: '',
          connectTimeout: 10000,
          receiveTimeout: 10000,
          // validateStatus:(state){

          //   return true;
          // }
        );

        _dioRequest = Dio(options);
        // _dioRequest.interceptors.add(new ResponseInterceptors());
        _dioRequest.interceptors.add(new DioLogInterceptor());


    }
    return _dioRequest;
  }

  // 请求，返回参数为 T
  // method：请求方法，Method.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  static Future request<T>(Method method, String path, dynamic params,
      {Success success, Fail fail}) async {
    try {
      //没有网络
      var connectivityResult = await (new Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        _onError(ExceptionHandle.net_error, '网络异常，请检查你的网络！', fail);
        return;
      }
      Dio _dio = createInstance();
      Response response = await _dio.request(path,
          data: params, options: Options(method: MethodValues[method]));
      if (response != null) {
        if (success != null) {
          success(response.data);
        }
      } else {
        _onError(ExceptionHandle.unknown_error, '未知错误', fail);
      }
    } on DioError catch (e) {
//      LogUtils.print_('请求出错：' + e.toString());
      final NetError netError = ExceptionHandle.handleException(e);
      _onError(netError.code, netError.msg, fail);
    }
  }
  
  
}


enum Method { GET, POST, DELETE, PUT, PATCH, HEAD }

//使用：MethodValues[Method.POST]
const MethodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put",
  Method.PATCH: "patch",
  Method.HEAD: "head",
};

void _onError(int code, String msg, Fail fail) {
  if (code == null) {
    code = ExceptionHandle.unknown_error;
    msg = '未知异常';
  }
  LogUtils.print_('接口请求异常： code: $code, msg: $msg');
  if (fail != null) {
    fail(code, msg);
  }
}

///日志拦截器
class DioLogInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    String requestStr = "\n==================== REQUEST ====================\n"
        "- URL:\n${options.baseUrl + options.path}\n"
        "- METHOD: ${options.method}\n";

    requestStr += "- HEADER:\n${options.headers.mapToStructureString()}\n";

    final data = options.data;
    if (data != null) {
      if (data is Map)
        requestStr += "- BODY:\n${data.mapToStructureString()}\n";
      else if (data is FormData) {
        final formDataMap = Map()
          ..addEntries(data.fields)
          ..addEntries(data.files);
        requestStr += "- BODY:\n${formDataMap.mapToStructureString()}\n";
      } else
        requestStr += "- BODY:\n${data.toString()}\n";
    }
    print(requestStr);
    return options;
  }

  @override
  Future onError(DioError err) async {
    String errorStr = "\n==================== RESPONSE ====================\n"
        "- URL:\n${err.request.baseUrl + err.request.path}\n"
        "- METHOD: ${err.request.method}\n";

    errorStr +=
        "- HEADER:\n${err.response.headers.map.mapToStructureString()}\n";
    if (err.response != null && err.response.data != null) {
      print('╔ ${err.type.toString()}');
      errorStr += "- ERROR:\n${_parseResponse(err.response)}\n";
    } else {
      errorStr += "- ERRORTYPE: ${err.type}\n";
      errorStr += "- MSG: ${err.message}\n";
    }
    print(errorStr);
    return err;
  }

  @override
  Future onResponse(Response response) async {
    String responseStr =
        "\n==================== RESPONSE ====================\n"
        "- URL:\n${response.request.uri}\n";
    responseStr += "- HEADER:\n{";
    response.headers.forEach(
        (key, list) => responseStr += "\n  " + "\"$key\" : \"$list\",");
    responseStr += "\n}\n";
    responseStr += "- STATUS: ${response.statusCode}\n";

    if (response.data != null) {
      responseStr += "- BODY:\n ${_parseResponse(response)}";
    }
    printWrapped(responseStr);
    return response;
  }

  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  String _parseResponse(Response response) {
    String responseStr = "";
    var data = response.data;
    if (data is Map)
      responseStr += data.mapToStructureString();
    else if (data is List)
      responseStr += data.listToStructureString();
    else
      responseStr += response.data.toString();

    return responseStr;
  }
}

extension Map2StringEx on Map {
  String mapToStructureString({int indentation = 2}) {
    String result = "";
    String indentationStr = " " * indentation;
    if (true) {
      result += "{";
      this.forEach((key, value) {
        if (value is Map) {
          var temp = value.mapToStructureString(indentation: indentation + 2);
          result += "\n$indentationStr" + "\"$key\" : $temp,";
        } else if (value is List) {
          result += "\n$indentationStr" +
              "\"$key\" : ${value.listToStructureString(indentation: indentation + 2)},";
        } else {
          result += "\n$indentationStr" + "\"$key\" : \"$value\",";
        }
      });
      result = result.substring(0, result.length - 1);
      result += indentation == 2 ? "\n}" : "\n${" " * (indentation - 1)}}";
    }

    return result;
  }
}

extension List2StringEx on List {
  String listToStructureString({int indentation = 2}) {
    String result = "";
    String indentationStr = " " * indentation;
    if (true) {
      result += "$indentationStr[";
      this.forEach((value) {
        if (value is Map) {
          var temp = value.mapToStructureString(indentation: indentation + 2);
          result += "\n$indentationStr" + "\"$temp\",";
        } else if (value is List) {
          result += value.listToStructureString(indentation: indentation + 2);
        } else {
          result += "\n$indentationStr" + "\"$value\",";
        }
      });
      result = result.substring(0, result.length - 1);
      result += "\n$indentationStr]";
    }

    return result;
  }
}


class ResultData {
  var data;
  bool isSuccess;
  int code;
  var headers;

  ResultData(this.data, this.isSuccess, this.code, {this.headers});
}


// class ResponseInterceptors extends InterceptorsWrapper {
//   @override
//   onResponse(Response response) {
//     RequestOptions option = response.request;
//     try {
//       if (option.contentType != null &&
//           option.contentType.primaryType == "text") {
//         return new ResultData(response.data, true, Code.SUCCESS);
//       }
//       ///一般只需要处理200的情况，300、400、500保留错误信息
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         int code = response.data["code"];
//         if (code == 0) {
//           return new ResultData(response.data, true, Code.SUCCESS,
//               headers: response.headers);
//         } else if (code == 100006 || code == 100007) {

//         } else {
//           Fluttertoast.showToast(msg: response.data["msg"]);
//           return new ResultData(response.data, false, Code.SUCCESS,
//               headers: response.headers);
//         }
//       }
//     } catch (e) {
//       print(e.toString() + option.path);

//       return new ResultData(response.data, false, response.statusCode,
//           headers: response.headers);
//     }

//     return new ResultData(response.data, false, response.statusCode,
//         headers: response.headers);
//   }
// }











  class ShardPreferencesUtil {
  ShardPreferencesUtil._();

  static ShardPreferencesUtil _instance;

  static ShardPreferencesUtil getInstance() {
    if (_instance == null) {
      _instance = ShardPreferencesUtil._();
    }
    return _instance;
  }
}