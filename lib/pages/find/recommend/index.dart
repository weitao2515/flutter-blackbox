import 'package:flutter/material.dart';
import '../../../component/avatar.dart';
import '../../../models/news.dart';
import 'mock.dart';

class Recommend extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: LocalAvatar(),// 用户头像
                  ),
                  Text(nameList[index%7]),//用户昵称
                ],
              ),
              Text('小谈《冰汽时代》：冰点之下炽热的人性光辉',style: TextStyle(fontSize: 18),),
              Text(articleList[0],style: TextStyle(fontSize: 16),maxLines: 4,overflow:TextOverflow.ellipsis),
              Container(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Tato,2小时前'),
                    Row(
                      children: <Widget>[
                        Icon(Icons.message,size: 15,),
                        Text(' 30')
                      ],
                    )
                  ],
                ),
                ),
            ],
          ),
          decoration: BoxDecoration(
            border: Border(bottom:BorderSide(width: 1,color: Colors.grey[300]))
          ),
        );
      }
    );
  }
}