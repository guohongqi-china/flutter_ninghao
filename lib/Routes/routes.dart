import 'package:flutter/material.dart';

import '../Tabs//home.dart';
import '../Tabs/Tabs.dart';

final routeContainer = {
   '/':(context) => TabPage(),
   '/home': (context) => HomePage()
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