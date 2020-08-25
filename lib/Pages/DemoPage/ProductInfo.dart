import 'package:flutter/material.dart';

class ProductInfoPage extends StatefulWidget {
  Map arguments;
  ProductInfoPage({Key key, this.arguments});

  @override
  _ProductInfoPageState createState() =>
      _ProductInfoPageState(arguments: this.arguments);
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  Map arguments;
  _ProductInfoPageState({this.arguments});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(this.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('2345')), body: Text('pid=${arguments}'));
  }
}

// class ProductInfoPage extends StatefulWidget {
//   Map arguments;
//   ProductInfoPage(Key key,{this.arguments});

//   @override
//   _ProductInfoPageState createState() => _ProductInfoPageState(arguments:this.arguments);
// }

// class _ProductInfoPageState extends State<ProductInfoPage> {
//   Map arguments;
//   _ProductInfoPageState({this.arguments});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child:Text('pid=${arguments["pid"]}')
//     );
//   }
// }
