import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TableViewPage extends StatefulWidget {
  @override
  _TableViewPageState createState() => _TableViewPageState();
}

class _TableViewPageState extends State<TableViewPage> {
  dynamic _data;
  bool _hasMore = true;
  List _list = [];
  int _page = 1;
  ScrollController _scrollcontroller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getData().then(_refreshState());

    _scrollcontroller.addListener(() {
      print("当前下拉距离${_scrollcontroller.position.pixels}"); // 获取滚动条下拉的距离
      _scrollcontroller.position.maxScrollExtent; // 获取整个页面的高度
      if (_scrollcontroller.position.pixels >
          _scrollcontroller.position.maxScrollExtent - 40.0) {
        this._page++;
        _loadMoreData().then(_addMoreData());
      }
    });
  }

  Future _getData() async {
    var apiUrl =
        "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1";
    var response = await Dio().get(apiUrl);
    return response;
  }

  Future _loadMoreData() async {
    var apiUrl =
        "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=$_page";
    var response = await Dio().get(apiUrl);
    return response;
  }

  Widget _renderWidget(context, index) {
    Widget content = ListTile(
      title: Text(
        this._list[index]['title'],
        maxLines: 1,
      ),
    );
    Widget result1 = Column(
      children: <Widget>[
        content,
        Divider(),
        this._hasMore ? _getMoreWidget() : Text('数据加载完毕'),
      ],
    );
    Widget result2 = Column(
      children: <Widget>[
        content,
        Divider(),
      ],
    );
    return index == this._list.length - 1 ? result1 : result2;
  }

  Function _refreshState() {
    return (value) {
      setState(() {
        print("9999999");
        this._list = json.decode(value.data)['result'];
      });
    };
  }

  Function _addMoreData() {
    return (value) {
      setState(() {
        print("9999999");
        List arr = json.decode(value.data)['result'];
        setState(() {
          this._hasMore = arr.length == 20; // 判断是否最后一页
        });
        this._list.addAll(arr);
      });
    };
  }

  Future<void> _onRefresh() {
    return _getData().then(_refreshState());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新闻列表"),
      ),
      body: this._list.length > 0
          ? RefreshIndicator(
              child: ListView.builder(
                  controller: _scrollcontroller,
                  itemCount: this._list.length,
                  itemBuilder: _renderWidget),
              onRefresh: _onRefresh)
          : Center(
              child: Text('正在加载中....'),
            ),
    );
  }

  /** * 加载更多时显示的组件,给用户提示 */
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
