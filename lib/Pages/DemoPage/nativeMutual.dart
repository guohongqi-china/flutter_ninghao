import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// const nativeChannel = const MethodChannel('wg/native_get');

class NativeMutualPage extends StatefulWidget {
  @override
  _NativeMutualPageState createState() => _NativeMutualPageState();
}

class _NativeMutualPageState extends State<NativeMutualPage>
    with WidgetsBindingObserver {
  // 注册一个通知,监听原生传给自己的值
  static const EventChannel eventChannel = const EventChannel('wg/native_post');
  static const MethodChannel methodChannel =
      const MethodChannel('wg/native_get');

  // 渲染前的操作，类似viewDidLoad
  @override
  void initState() {
    super.initState();

    // 监听事件，同时发送参数12345
    eventChannel
        .receiveBroadcastStream(12345)
        .listen(_onEvent, onError: _onError);
    //添加生命周期观察者
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //销毁生命周期观察者
    WidgetsBinding.instance.removeObserver(this);
  }

  String naviTitle;

  // 回调事件
  void _onEvent(Object event) {
    setState(() {
      naviTitle = event.toString();
    });
  }

  // 错误返回
  void _onError(Object error) {}

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   // TODO: implement didChangeAppLifecycleState
  //   super.didChangeAppLifecycleState(state);

  //   if (state != AppLifecycleState.resumed) {
  //     methodChannel.invokeMethod(
  //         'changeNavStatus', 'didChangeAppLifecycleState:${state}-show');
  //   } else {
  //     methodChannel.invokeMethod(
  //         'changeNavStatus', 'didChangeAppLifecycleState:${state}-hiden');
  //   }
  // }

  String content;
  // 跳转原生界面，并传递参数
  _iosGetMap() async {
    String str =
        await methodChannel.invokeMethod('pushSquarePage', '这是flutter传的字符串');
    setState(() {
      this.content = str;
    });
  }

  // 跳转原生界面传递Map参数
  _iosGoVC() async {
    Map<String, dynamic> value = {
      "code": "200",
      "data": [1, 2, 3]
    };
    await methodChannel.invokeMapMethod('pushSquarePage', value);
  }

  @override
  Widget build(BuildContext context) {
    Widget body = ListView(
      children: [
        demoItem(
          "跳转原生界面,传递字符串参数",
          _iosGetMap,
          marginTop: 20.0,
        ),
        demoItem(
          "跳转原生界面,传递Map参数",
          _iosGoVC,
          marginTop: 20.0,
        ),
        this.content == null
            ? Text('')
            : Text("flutter调用原生方法，原生被动返回给flutter的参数为：${this.content}"),
        SizedBox(
          height: 30.0,
        ),
        this.naviTitle == null
            ? Text('')
            : RichText(
                text: TextSpan(
                    text: "IOS 主动给flutter传递的参数为：",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                    children: [
                    TextSpan(
                        text: this.naviTitle,
                        style: TextStyle(fontSize: 16.0, color: Colors.red))
                  ])),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter Native 交互"),
      ),
      body: body,
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
