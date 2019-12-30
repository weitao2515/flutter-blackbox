import 'package:flutter/material.dart';
import 'search.dart';
import 'news.dart';
import 'like.dart';
import '../../component/avatar.dart';
import '../../models/news.dart';
class Find extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FindTitle();
  }
}

class FindTitle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FindTitleState();
}

class FindTitleState extends State<FindTitle> {
  final List<Tab> tabs = <Tab>[
    new Tab(
      text: '关注',
    ),
    new Tab(
      text: '头条',
    ),
    new Tab(
      text: '推荐',
    ),
  ];
  final activeWidget = [
    Like(),
    Bar(),
    Recommend(),
  ];
  @override
  Widget build(BuildContext context) {
    //返回一个默认的tab控制器，用于tabBar和tabBarView的联动控制
    return new DefaultTabController(
      //length表示一个有几个标签栏
      initialIndex:1,//默认激活
      length: tabs.length,
      //返回一个包含了appBar和body内容区域的脚手架
      child: new Scaffold(
        appBar: new AppBar(
          //标签栏位置存于appBar的底部，tabs是一个widget数组，就是每个标签栏的内容
          title: new TabBar(
            tabs: tabs,
            isScrollable: true,
            //标签颜色
            labelColor: Colors.black,
            indicatorColor:Colors.white,
            //未被选中的标签的颜色
            unselectedLabelColor: Colors.grey,
            labelStyle: new TextStyle(fontSize: 22.0),
            unselectedLabelStyle: new TextStyle(fontSize: 18.0),
          ),
          backgroundColor: Colors.white,
          actions: <Widget>[
            GestureDetector(
              child: Container(
                padding: EdgeInsets.fromLTRB(20,0,20,0),
                child: Icon(Icons.search,size: 30,color: Colors.black,),
              ),
              onTap: ()=>Navigator.push( context,
                MaterialPageRoute(builder: (context) {
                    return FindSearch();
                })),
            ),
            GestureDetector(
              child:Container(
                padding: EdgeInsets.fromLTRB(0,0,20,0),
                child: Icon(Icons.mail,size: 30,color: Colors.black,),
              ),
            ),
          ],
        ),
        //根据tab内容，我在每个标签对应的视图里放了一个简单的文本，内容就是对应的标签名称。
        body: new TabBarView(
          children: tabs.asMap().keys.map((i) {
            return activeWidget[i];
          }).toList(),
        ),
      ),
    );
  }
}


class Bar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BarState();
}

class BarState extends State<Bar> with AutomaticKeepAliveClientMixin {
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


class Recommend extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: LocalAvatar(),
              ),
              Text(nameList[index%7])
            ],)
          ],
        );
      }
    );
  }
}