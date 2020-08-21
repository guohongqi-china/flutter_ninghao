import 'package:flutter/material.dart';

import '../Tabs//home.dart';
import '../Tabs/Tabs.dart';
import '../Pages/LRPage/register.dart';
import '../Pages/LRPage/registersecond.dart';
import '../Tabs/shopCar.dart';
import '../Tabs/memberManager.dart';
import '../Tabs/listDemo.dart';
import '../Pages/DemoPage/listViewOne.dart';
import '../Pages/DemoPage/listViewTwo.dart';
import '../Pages/DemoPage/card_demo.dart';
import '../Pages//DemoPage/network.dart';
import '../Pages/DemoPage/tableView.dart';
import '../Pages/DemoPage/fpsList.dart';
import '../Pages/DemoPage/imageLayout.dart';
import '../Pages/DemoPage/gridview.dart';

final routeContainer = {
  '/': (context) => TabPage(),
  '/home': (context) => HomePage(),
  '/register': (context) => RegisterFirst(),
  '/registersecond': (context) => RegisterSecondPage(),
  '/shopcar': (context) => ShopCarPage(),
  '/member': (context) => MemberManagerPage(),
  '/listdemo': (context) => ListPage(),
  '/listone': (context) => ListViewOnePage(),
  '/listtwo': (context) => ListViewTwoPage(),
  '/listcard': (context) => CardDemo(),
  '/network': (context) => NetworkPage(),
  '/tableview': (context) => TableViewPage(),
  '/fpspage': (context) => FPSListPage(),
  '/imagelayout': (context) => ImageLayoutPage(),
  '/gridview': (context) => GridViewPage()
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routeContainer[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
