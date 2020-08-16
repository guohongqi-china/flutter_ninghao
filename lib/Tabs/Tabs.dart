import 'package:flutter/material.dart';

import './home.dart';
import './Category.dart';
import './Mine.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  var _currentIndex = 0;

  final bodyList = [HomePage(), CategoryPage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.bodyList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("分类")),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), title: Text("我的")),
          ]),
    );
  }
}

// class TabPage extends StatelessWidget {
//   final _currentIndex = 0;

//   final bodyList = [HomePage(), CategoryPage(), MinePage()];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('demo')),
//       body: this.bodyList[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           onTap: (index) {

//           },
//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.category), title: Text("分类")),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.people), title: Text("我的")),
//           ]),
//     );
//   }
// }
