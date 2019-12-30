import 'package:flutter/material.dart';

class FindSearch extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme:IconThemeData(color: Colors.black),
        title: TextField(
          style: TextStyle(color: Colors.grey),
          decoration: InputDecoration(
            hintText: "请输入搜索内容",
            prefixIcon: Icon(Icons.search,color: Colors.black,),
            filled: true,
            fillColor: Colors.grey[100],
            border:InputBorder.none,
          ),
          cursorColor:Colors.black,
          
        )
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //横轴三个子widget
              childAspectRatio: 3.5 //宽高比为1时，子widget
          ),
          children:<Widget>[
            SearchHistory(text: "荒野大镖客",type: 1,),
            SearchHistory(text: "死亡搁浅",type: 2,),
            SearchHistory(text: "黑魂3",type: 2,),
            SearchHistory(text: "只狼",type: 2,),
            SearchHistory(text: "彩虹六号",type: 2,),
            SearchHistory(text: "怪物猎人世界",type: 2,),
            SearchHistory(text: "巫师3",type: 2,),
          ]
        ),
      )
    );
  }
}

class SearchHistory extends StatelessWidget{
  SearchHistory({Key key, this.text,this.type}) : super(key: key);
  final text;
  final type;
  @override
  Widget build(BuildContext context){
    return Container(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
        color: Colors.grey[200],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text,style: TextStyle(fontSize: 15),),
            type==1?Icon(Icons.flash_on,size: 15,):Text('')
          ],
        )
      );
    }
}