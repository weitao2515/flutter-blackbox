import 'package:flutter/material.dart';

class RecommendOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(15),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Icon(Icons.extension,size: width/9,),
              Text('赠送游戏'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.local_movies,size: width/9,),
              Text('即将发售'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.forum,size: width/9,),
              Text('评测试玩'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.camera_roll,size: width/9,),
              Text('游戏厂商'),
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.store,size: width/9,),
              Text('H币商城'),
            ],
          ),
        ],
      ),
    );
  }
}