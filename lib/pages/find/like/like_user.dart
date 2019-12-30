import 'package:flutter/material.dart';
import 'dart:io'; // 网络请求
import 'dart:convert'; // 数据解析

class LikeUser extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future:_getImage(),
      builder: (BuildContext context,AsyncSnapshot snapShot){
        print('data:${snapShot.data}');
        print('connectionState:${snapShot.connectionState}');
        if(snapShot.connectionState == ConnectionState.waiting){
          return Text('');
        }else {
            return Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            height: 60,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  //头像半径
                  radius: 30,
                  //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                  backgroundImage: NetworkImage(
                    snapShot.data
                  ),
                ),
                Text('AiAi')
              ],
            )
          );
        }
      }
    );
  }
  _getImage() async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(
                        Uri.parse("https://api.uomg.com/api/rand.avatar?sort=%E5%8A%A8%E6%BC%AB%E5%A5%B3&format=json"));
    var response = await request.close();
    var responseBody = await response.transform(Utf8Decoder()).join();
    var data = jsonDecode(responseBody)['imgurl'];
    return data;
  }
}