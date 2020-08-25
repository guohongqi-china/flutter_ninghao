import 'package:Flutter_ninghao/Pages/DemoPage/nativeMutual.dart';
import 'package:flutter/material.dart';
import './Routes/routes.dart';

//引入下面这个，是为了调用window的defaultRouteName拿到route判断跳转哪个界面
import 'dart:ui';

void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget body = MyApp();

//根据原生给的名字，确定显示那个界面
Widget _widgetForRoute(String route) {
  switch (route) {
    case 'myApp':
      return NativeMutualPage();
    case 'home':
      return body;
    default:
      return body;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // 去除debug图标
        theme: ThemeData(primaryColor: Colors.pink),
        // home:Tabs(),
        initialRoute: '/', //初始化的时候加载的路由
        onGenerateRoute: onGenerateRoute);
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//        debugShowCheckedModeBanner: false, // 去除debug图标
//         theme: ThemeData(primaryColor: Colors.pink),
//         //  home: TabPage(),
//         initialRoute: '/',
//         routes: routes,
//         onGenerateRoute: onGenerateRoute);
//   }
// }
