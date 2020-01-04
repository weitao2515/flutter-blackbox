import 'package:flutter/material.dart';
import '../../component/search.dart';
import './recommend/index.dart';
import './encyclopedia/index.dart';
import './list/index.dart';
class Game extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new GameState();
}

class GameState extends State<Game> {
  final List<Tab> tabs = <Tab>[
    new Tab(
      text: '百科',
    ),
    new Tab(
      text: '推荐',
    ),
    new Tab(
      text: '榜单',
    ),
  ];
  final activeWidget = [
    Encyclopedia(),
    Recommend(),
    Leaderboard(),
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

