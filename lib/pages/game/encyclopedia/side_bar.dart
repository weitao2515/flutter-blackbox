import 'package:flutter/material.dart';
import './model.dart';

class SideBar extends StatefulWidget {
  SideBar({Key key, this.scroll}) : super(key: key);
  final scroll;
  @override
  State<StatefulWidget> createState() {
    return _SideBarState();
  }
}

class _SideBarState extends State<SideBar> {
  List<Widget> tabs = <Widget>[];
  num activeIndex;
  _init(){
    for (var item in A_Z_LIST) {
      tabs.add(Padding(
        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
        child: Text(item,style: TextStyle(color: Colors.grey,fontSize: 12),),
      ));
    }
  }
  @override
  void initState() {
    _init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 30,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(0, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tabs
        ),
      ),
      onPanDown:(DragDownDetails e){
        RenderBox box = context.findRenderObject();
        Offset topLeftPosition = box.localToGlobal(Offset.zero);
        print(topLeftPosition.dy.toInt());
        print(e.globalPosition.dy.toInt());//全局高度
        widget.scroll(e.globalPosition.dy.toInt()*5);
      },
      onPanUpdate: (DragUpdateDetails e) {
        //用户手指滑动时，更新偏移，重新构建
        widget.scroll(e.globalPosition.dy.toInt()*5);
      },
    );
  }
}