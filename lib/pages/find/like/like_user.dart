import 'package:flutter/material.dart';
import '../../../component/avatar.dart';

class LikeUser extends StatelessWidget{
  LikeUser({Key key, this.username}) : super(key: key);
  final username;
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      height: 60,
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Avatar(),
          Text(username),
        ],
      ),
    );
  }
}