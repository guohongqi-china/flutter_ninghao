import 'package:flutter/material.dart';
import '../../Resources/datasource.dart';

class FPSListPage extends StatefulWidget {
  @override
  _FPSListPageState createState() => _FPSListPageState();
}

class _FPSListPageState extends State<FPSListPage> {
  List listData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = listItems;
  }

  Widget buildWidget(context, index) {
    return Card(
      color: Color.fromRGBO(240, 240, 240, 1),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://www.itying.com/images/flutter/2.png'),
            ),
            title: Text('67777778888'),
            subtitle: Text('555555555555555555'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
            child: Text(
              'sfasdfasdklfnaksjdnfaksdnfkjasdbnfkjasd打反手打客服那棵树的南方喀什DNF卡死的发达是的发的发生的发酵是的发送到浪费看少得可怜发斯蒂芬拉是的发送到阿斯顿发送到发送到发送',
              maxLines: 3,
              style: TextStyle(
                  color: Color.fromRGBO(150, 150, 150, 1), fontSize: 15.0),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          listItems[index]['ismore']
              ? Container(
                  width: double.infinity,
                  color: Colors.red,
                  height: 250.0,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Wrap(
                    // alignment: WrapAlignment.start,
                    // crossAxisAlignment: WrapCrossAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        width: 100.0,
                        height: 100.0,
                        child: Image.network(
                            "https://www.itying.com/images/flutter/3.png"),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        width: 100.0,
                        height: 100.0,
                        child: Image.network(
                            "https://www.itying.com/images/flutter/3.png"),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        width: 100.0,
                        height: 100.0,
                        child: Image.network(
                            "https://www.itying.com/images/flutter/3.png"),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        width: 100.0,
                        height: 100.0,
                        child: Image.network(
                            "https://www.itying.com/images/flutter/3.png"),
                      ),
                    ],
                  ))
              : Text("33"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FPS'),
        ),
        body: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: buildWidget,
        ));
  }
}
