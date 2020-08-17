import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './home.dart';
import './Category.dart';
import './Mine.dart';
import './shopCar.dart';
import './memberManager.dart';
import './listDemo.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}


class _TabPageState extends State<TabPage> {

  var _currentIndex = 0;

  final List<BottomNavigationBarItem> bottomItems = [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
        BottomNavigationBarItem(icon: Icon(Icons.category), title: Text("分类")),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text("购物车")),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), title: Text("会员中心")),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.volume_mute), title: Text("demo")),
  ];

  final List<Widget> bodyList = [HomePage(), CategoryPage(), ShopCarPage(), MemberManagerPage(),ListPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.bodyList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, //配置底部tabs可以有多个按钮
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          items: bottomItems
      ),
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
