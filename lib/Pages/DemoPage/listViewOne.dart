import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import '../Resources/post.dart';
import '../../Tabs/listData.dart';

class ListViewOnePage extends StatelessWidget {
  
  final _cardColor = Color.fromRGBO(240, 240, 240, 1);

  //自定义方法
  List<Widget> _getData() {
    var tempList = listData.map((value) {
      return ListTile(
          leading: Image.network(value["imageUrl"]),
          title: Text(value["title"]),
          subtitle: Text(value["author"]));
    });
    // ('124124','124214')
    return tempList.toList();
  }
  List<Widget> _getLocalData() {
    var templist = listData.map((value) {
      var imgWidget = Image.network(
        value["imageUrl"],
        fit: BoxFit.cover,
      );
      var titleWidget = Center(
        child: Text(value['title'], style: TextStyle(fontSize: 20.0)),
      );
      var subtitleWidget = Center(
        child: Text(
          value['author'],
          style:
              TextStyle(fontSize: 16.0, color: Color.fromRGBO(54, 54, 54, 1.0)),
        ),
      );
      return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        color: _cardColor,
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1.6,
                child: Container(color: Colors.red, child: imgWidget),
              ),
              ListTile(title: titleWidget, subtitle: subtitleWidget),
            ],
          ),
        ),
      );
    });
    return templist.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: ListView(children: this._getLocalData()),
    );
  }

// ======================================= build 方式 ===========================================

//  Widget _currentIndex(context,index){

//      return Container(
//               padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//               color: _cardColor,
//               child: Container(
//                 color: Colors.white,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     AspectRatio(
//                       aspectRatio: 1.6,
//                       child: Container(
//                         color: Colors.red,
//                         child: Image.network(listData[index]["imageUrl"],fit: BoxFit.cover,),
//                       ),
//                     ),
//                     ListTile(
//                       title: Center(
//                         child: Text(listData[index]['title'],style: TextStyle(fontSize: 20.0)),
//                       ),
//                       subtitle: Center(
//                         child:Text(listData[index]['author'],style: TextStyle(fontSize: 16.0,color: Color.fromRGBO(54, 54, 54, 1.0)),),
//                       )
//                     ),
//                   ],
//                 ),
//               ),
//             );
//  }
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: listData.length,
//         itemBuilder: this._currentIndex,
//     );
//   }
}

// class HomePage extends StatelessWidget {

//  final _cardColor = Color.fromRGBO(240, 240, 240, 1);

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//         children: [
//            Container(
//               padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//               color: _cardColor,
//               child: Container(
//                 color: Colors.white,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     AspectRatio(
//                       aspectRatio: 1.6,
//                       child: Container(
//                         color: Colors.red,
//                         child: Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597511027428&di=52b04c06328c05b288ddfb73e4b0a7ef&imgtype=0&src=http%3A%2F%2Fimages.china.cn%2Fattachement%2Fjpg%2Fsite1000%2F20170424%2F7427ea210a2c1a677cda59.jpg",fit: BoxFit.cover,),
//                       ),
//                     ),
//                     ListTile(
//                       title: Center(
//                         child: Text("fsdfasdfas",style: TextStyle(fontSize: 20.0)),
//                       ),
//                       subtitle: Center(
//                         child:Text("22222222222",style: TextStyle(fontSize: 16.0,color: Color.fromRGBO(54, 54, 54, 1.0)),),
//                       )
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           AspectRatio(
//             aspectRatio: 1.6,
//             child: Container(
//               padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//               color: _cardColor,
//               child: Container(
//                 color: Colors.white,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     AspectRatio(
//                       aspectRatio: 2.7,
//                       child: Container(
//                         color: Colors.red,
//                         child: Image.network("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597511027428&di=52b04c06328c05b288ddfb73e4b0a7ef&imgtype=0&src=http%3A%2F%2Fimages.china.cn%2Fattachement%2Fjpg%2Fsite1000%2F20170424%2F7427ea210a2c1a677cda59.jpg",fit: BoxFit.cover,),
//                       ),
//                     ),
//                     ListTile(
//                       title: Center(
//                         child: Text("fsdfasdfas"),
//                       ),
//                       subtitle: Center(
//                         child:Text("22222222222"),
//                       )
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           AspectRatio(
//             aspectRatio: 1.6,
//             child: Container(
//               padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//               color: _cardColor,
//               child: Container(
//               color: Colors.white,
//               ),
//             ),
//           ),
//           AspectRatio(
//             aspectRatio: 1.6,
//             child: Container(
//               padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//               color: _cardColor,
//               child: Container(
//                 color: Colors.white,
//               ),
//             ),
//           )
//         ],
//     );
//   }
// }
