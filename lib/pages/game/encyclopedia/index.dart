import 'package:flutter/material.dart';
import './side_bar.dart';

class Encyclopedia extends StatelessWidget {
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
      children: <Widget>[
        ListView(
          shrinkWrap: true,
          controller: _controller,
          children: <Widget>[
            Content(title: "热门推荐",count:10),
            Content(title: "全部",count:200)
          ],
        ),
        Positioned(
          right: 0,
          child: SideBar(scroll:(position)=>scroll(position)),
        )
      ],
    );
  }
  void scroll(postion){
    print(scroll);
    _controller.animateTo(postion.toDouble(),duration: Duration(milliseconds: 200),
                curve: Curves.ease);
  }
}


class Content extends StatelessWidget {
  Content({Key key,this.title,this.count}):super(key:key);
  final title;
  final count;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,style: TextStyle(fontSize: 16),),
          GridView.builder( 
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //每行三列
              childAspectRatio: 3 //显示区域宽高相等
            ),
            itemCount: count,
            itemBuilder: (context, index) {
              return Item();
            },
          ),
        ],  
      ),
    );
  }
}


class Item extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      color: Colors.grey[100],
      child:Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(3,3,8,3),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child:Image(
                height: 45,
                width: 45,
                fit: BoxFit.fill,
                image: AssetImage('images/title.png'),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("只狼",style:TextStyle(fontSize: 14),),
              Text("216个词条",style:TextStyle(fontSize: 11,color: Colors.grey),)
            ],
          ),
        ],
      )
    );
  }
}