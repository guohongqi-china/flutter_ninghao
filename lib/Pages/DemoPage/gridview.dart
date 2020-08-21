import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('网格布局'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //纵轴间距 （主轴是Y轴）
                mainAxisSpacing: 10.0,
                //横轴间距
                crossAxisSpacing: 10.0,

                ///子组件宽高长度比例
                childAspectRatio: 1,

                ///横轴元素个数
                crossAxisCount: 2,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.red,
                );
              }),
        ));
  }
}
