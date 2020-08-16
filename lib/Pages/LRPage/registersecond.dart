import 'package:flutter/material.dart';
import 'dart:async';

class RegisterSecondPage extends StatefulWidget {
  @override
  _RegisterSecondPageState createState() => _RegisterSecondPageState();
}

class _RegisterSecondPageState extends State<RegisterSecondPage> {
  int _count = 10;
  Timer _timer;
  int _start = 10; //
  bool timeing = false;

  void startTimer() {
    const oneSec = const Duration(seconds: 1); //间隔1秒
    _timer = new Timer.periodic(
      oneSec, //每秒调用一次
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            //如果小于1则停止倒计
            timer.cancel();
            _start = _count;
            timeing = false;
          } else {
            _start = _start - 1; //自减一tru
            timeing = true;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手机快速注册"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text("请输入你收到的正确的验证码:"),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 40.0,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '请输入验证码',
                      ),
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    height: 40.0,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text(_start != _count ? "$_start S" : "重新发送"),
                    ),
                  )),
            ],
          ),
          Expanded(
              child: RaisedButton(
            onPressed: () {
              startTimer();
            },
            child: Text("开始计时"),
          )),
          this.timeing ? Text('计时中') : Text("计时器")
        ],
      ),
    );
  }
}
