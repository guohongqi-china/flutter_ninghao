import 'package:flutter/material.dart';

class RegisterFirst extends StatefulWidget {
  @override
  _RegisterFirstState createState() => _RegisterFirstState();
}

class _RegisterFirstState extends State<RegisterFirst> {
  var nextEnable = false;

  String _selectPhone = "1";
  Widget _drowPhone() {
    return DropdownButtonHideUnderline(
        child: DropdownButton(
            value: this._selectPhone,
            items: [
              DropdownMenuItem(child: Text('+86'), value: '1'),
              DropdownMenuItem(child: Text('+87'), value: '2'),
              DropdownMenuItem(child: Text('+88'), value: '3')
            ],
            onChanged: (value) {
              setState(() {
                this._selectPhone = value;
              });
              print(value);
            }));
  }

  Widget _nextBtn() {
    var btn = null;
    switch (nextEnable) {
      case true:
        btn = RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/registersecond');
          },
          child: Text("下一步111"),
          color: Colors.blue,
          textColor: Colors.white,
        );
        break;
      case false:
        btn = RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/registersecond');
          },
          child: Text("下一步22233"),
          color: Color.fromRGBO(200, 200, 200, 1.0),
          textColor: Colors.red,
          splashColor: Color.fromRGBO(200, 200, 200, 1.0),
        );
        break;
      default:
    }
    return btn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("注册一"),
        ),
        body: ListView(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                height: 40.0,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.0,
                        color: Colors.green,
                        style: BorderStyle.solid)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: _drowPhone()),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        decoration: InputDecoration(
                            hintText: "请输入手机号",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                        onChanged: (value) {
                          if (value.length > 6) {
                            setState(() {
                              this.nextEnable = true;
                            });
                          } else {
                            setState(() {
                              this.nextEnable = false;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                )),
            Container(
                height: 40.0,
                margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: _nextBtn()),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: RichText(
                text: TextSpan(
                    text: "遇到问题？你可以 ",
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                    children: [
                      TextSpan(
                        text: "联系客服 ",
                        style: TextStyle(color: Colors.green, fontSize: 14.0),
                      )
                    ]),
              ),
            )
          ],
        ));
  }
}

// class RegisterFirst extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("注册一"),
//         ),
//         body: ListView(
//           children: [
//             Container(
//                 margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
//                 height: 40.0,
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                         width: 1.0,
//                         color: Colors.green,
//                         style: BorderStyle.solid)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                         flex: 1,
//                         child: RaisedButton(
//                           onPressed: () {
//                             Navigator.pushNamed(context, "/register");
//                           },
//                           child: Text("+86"),
//                         )),
//                     Expanded(
//                       flex: 3,
//                       child: TextField(
//                         textAlignVertical: TextAlignVertical.bottom,
//                         decoration: InputDecoration(
//                             hintText: "请输入手机号",
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide.none)),
//                       ),
//                     ),
//                   ],
//                 )),
//             Container(
//               height: 40.0,
//               margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
//               child: RaisedButton(
//                 onPressed: null,
//                 child: Text("下一步"),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
//               child: RichText(
//                 text: TextSpan(
//                     text: "遇到问题？你可以 ",
//                     style: TextStyle(color: Colors.red, fontSize: 14.0),
//                     children: [
//                       TextSpan(
//                         text: "联系客服 ",
//                         style: TextStyle(color: Colors.green, fontSize: 14.0),
//                       )
//                     ]),
//               ),
//             )
//           ],
//         ));
//   }
// }
