import 'package:flutter/material.dart';

class LayoutItemsPage extends StatelessWidget {
  LayoutItemsPage(
      {@required this.listData,
      @required this.layout,
      this.parentWidth,
      this.marginLeft = 10,
      this.marginRight = 10})
      : super();

  @override
  Widget build(BuildContext context) {
    var hspace = layout.horizontalSpace;
    var vspace = layout.verticalSapce;
    this.parentWidth = this.parentWidth == null
        ? MediaQuery.of(context).size.width
        : this.parentWidth;
    var kScreenWidth = this.parentWidth;
    var bodyW = kScreenWidth - this.marginLeft - this.marginRight;
    var mainCount = listData.length == 4 ? 2 : 3;
    var crossCount = listData.length == 4
        ? 2
        : (listData.length % 3 == 0
            ? listData.length ~/ 3
            : listData.length ~/ 3 + 1);
    var itemW =
        listData.length == 4 ? (bodyW - hspace) / 2 : (bodyW - hspace * 2) / 3;
    var bodyH = (crossCount - 1) * vspace + itemW * crossCount;

    return Container(
      margin: EdgeInsets.fromLTRB(this.marginLeft, 0, this.marginRight, 0),
      width: bodyW,
      height: bodyH,
      color: Colors.orange,
      child: GridView.builder(
          itemCount: listData.length,
          physics: NeverScrollableScrollPhysics(), //进制gridview滚动
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: mainCount,
            mainAxisSpacing: vspace,
            crossAxisSpacing: hspace,

            ///子组件宽高长度比例
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.green,
            );
          }),
    );
  }

  List listData;
  LayoutBounds layout;
  double parentWidth;
  double marginLeft;
  double marginRight;
}

class LayoutBounds {
  double horizontalSpace;
  double verticalSapce;
  final EdgeInsetsGeometry padding;
  LayoutBounds(
      {this.horizontalSpace = 5.0,
      this.verticalSapce = 5.0,
      this.padding = const EdgeInsets.all(0)})
      : super();
}
