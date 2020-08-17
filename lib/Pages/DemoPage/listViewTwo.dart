import 'package:flutter/material.dart';
import '../../Tabs/listData.dart';

class ListViewTwoPage extends StatelessWidget {
  
  final _cardColor = Color.fromRGBO(240, 240, 240, 1);
  

  Widget _getCurrentWidget(context,index){

    // return Container(
    //   margin: EdgeInsets.all(10),
    //   height: 200.0,
    //   child: Text("data"),
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: NetworkImage("https://www.itying.com/images/flutter/2.png"),
    //       fit: BoxFit.cover
    //     ),
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(10)
    //     )
    //   ),
    // );
  

    return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20)),
            clipBehavior: Clip.antiAlias,
            child:Container(
              height: 150,
              width: double.infinity,
              color: Colors.red,
              child: Stack(
                children: <Widget>[
                  Container(
                     width: double.infinity,
                     child: Image.network("https://www.itying.com/images/flutter/2.png",fit:BoxFit.cover),

                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text("12312312312"),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text("555555555555555"),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.search, size: 40, color: Colors.white),
                  ),
                ],
              ),
            )
          );
    
    // return Container(
    //   color: Colors.red,
    //   child: Card(
    //    borderOnForeground:true,
    //    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    //    child: Image.network("https://www.itying.com/images/flutter/2.png",)
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("卡片列表"),
      ),
      body: ListView.builder(
        itemBuilder: _getCurrentWidget,
        itemCount: listData.length,
      )
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
