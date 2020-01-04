import 'package:flutter/material.dart';
import './like_user.dart';
import '../../../models/news.dart';

class Like extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Container(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return LikeUser(username: nameList[index],);
            }
          ),
        ),
        Padding(
          padding:EdgeInsets.fromLTRB(10, 5, 10, 5),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('盒友动态',style: TextStyle(fontSize: 24,fontWeight:FontWeight.w700),),
              Icon(Icons.timelapse)
            ],
          )
        ),
      ],
    );
  }
}