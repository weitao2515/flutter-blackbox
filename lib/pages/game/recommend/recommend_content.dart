import 'package:flutter/material.dart';

class RecommendContent extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("热销商品",style: TextStyle(fontSize: 20,color: Colors.black),),
                Row(
                  children: <Widget>[
                    Text('更多',style: TextStyle(color: Colors.grey)),
                    Icon(Icons.keyboard_arrow_right,color: Colors.grey,)
                  ],
                )
              ],
            ),
          ),
          GridView.count( 
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing:10,
            shrinkWrap:true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Commodity(),
              Commodity(),
              Commodity(),
              Commodity(),
              Commodity(),
              Commodity(),
            ],
          ),
        ],
      ),
    );
  }
}


class Commodity extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    print(width);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          alignment: Alignment.topRight,
          // fit: StackFit.expand,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child:Image(
                height: width/4,
                width: width*1.78/4,
                fit: BoxFit.fill,
                image: AssetImage('images/title.png'),
              ),
            ),
            Container(
              width: 40,
              height: 20,
              alignment: Alignment.center,
              child: Text("-70%",style: TextStyle(color: Colors.white,fontSize: 13),),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(5.0)),
                color: Color.fromRGBO(0, 0, 0, .3),
              )
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Text("只狼",style: TextStyle(fontSize: 14),),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: Text("￥171",style: TextStyle(fontSize: 12),),
        ),
      ],
    );
  }
}