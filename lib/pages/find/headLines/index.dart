import 'package:flutter/material.dart';
import './news.dart';

class HeadLines extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HeadLinesState();
}

class HeadLinesState extends State<HeadLines> with AutomaticKeepAliveClientMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(
      text: '推荐',
    ),
    new Tab(
      text: 'PUBG',
    ),
    new Tab(
      text: 'CSGO',
    ),
    new Tab(
      text: 'Rainbow Six',
    ),
    new Tab(
      text: 'LOL',
    ),
    new Tab(
      text: '命运2',
    ),
  ];
  @override
  void initState() {
    super.initState();
  }
  @override
  bool get wantKeepAlive => true;//切换保留tab状态
  @override
  Widget build(BuildContext context) {
    super.build(context);
    //返回一个默认的tab控制器，用于tabBar和tabBarView的联动控制
    return new DefaultTabController(
      //length表示一个有几个标签栏
      length: tabs.length,
      //返回一个包含了appBar和body内容区域的脚手架
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor :Colors.white,
          //标签栏位置存于appBar的底部，tabs是一个widget数组，就是每个标签栏的内容
          title: new TabBar(
            tabs: tabs,
            isScrollable: true,
            //标签颜色
            labelColor: Colors.black,
            indicatorColor:Colors.black,
            //未被选中的标签的颜色
            unselectedLabelColor: Colors.grey,
            labelStyle: new TextStyle(fontSize: 16.0),
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0,0,10,0),
              child: Icon(Icons.settings,size: 20,color: Colors.black,),
            ),
          ],
        ),
        //根据tab内容，我在每个标签对应的视图里放了一个简单的文本，内容就是对应的标签名称。
        body: new TabBarView(
          children: tabs.asMap().keys.map((i) {
            return NewsList(type: i,);
          }).toList(),
        ),
      ),
    );
  }
}