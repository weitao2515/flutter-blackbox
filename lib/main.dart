import 'package:flutter/material.dart';
import './pages/user/index.dart';
import './pages/find/index.dart';
import './pages/community/index.dart';
import './pages/game/index.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation',
      home: Homes(),
      theme: ThemeData(primaryColor: Colors.black),
    );
  }
}

class Homes extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomesState();
  }
}

class _HomesState extends State<Homes> {
  int _currentIndex = 0;

  final List<Widget> _children = [Community(),Find(), Game(),  User()];


  final List<BottomNavigationBarItem> _list = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.navigation),
        title: Text('发现'),
        // backgroundColor: Colors.orange
        ),
    BottomNavigationBarItem(
        icon: Icon(Icons.print),
        title: Text('游戏库'),
        //backgroundColor: Colors.orange
        ),
    BottomNavigationBarItem(
        icon: Icon(Icons.track_changes),
        title: Text('社区'),
        //backgroundColor: Colors.orange
        ),
    BottomNavigationBarItem(
        icon: Icon(Icons.face),
        title: Text('我'),
        //backgroundColor: Colors.orange
        ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 设置内容在状态栏下方
      // appBar: PreferredSize(
      //   preferredSize:Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
      //   child:SafeArea(
      //     top: true,
      //     child: Offstage(),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        fixedColor:Colors.black,
        items: _list,
      ),
      body: IndexedStack( //切换页面保持状态
        index: _currentIndex,
        children: _children,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}