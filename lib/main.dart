import 'package:flutter/material.dart';

import './Routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
         primaryColor: Colors.yellow
       ),
      //  home: TabPage(),
       initialRoute: '/',
       routes: routeContainer,
       onGenerateRoute: onGenerateRoute
    );
  }
}