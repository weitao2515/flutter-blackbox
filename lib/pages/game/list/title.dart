import 'package:flutter/material.dart';


class ListTitle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new ListTitleState();
}

class ListTitleState extends State<ListTitle> {
  int activeIndex;
  @override
  void initState() {
    activeIndex = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.count( 
      crossAxisCount: 4,
      childAspectRatio: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        GestureDetector(
          onTap: ()=>setIndex(0),
          child:Container(
            color: activeIndex==0?Colors.white:Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.computer,size: 20,color: Colors.black,),
                Text('PC'),
              ],
            )
          ),
        ),
        GestureDetector(
          onTap: ()=>setIndex(1),
          child:Container(
            color: activeIndex==1?Colors.white:Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.computer,size: 20,color: Colors.black,),
                Text('Switch'),
              ],
            )
          ),
        ),
        GestureDetector(
          onTap: ()=>setIndex(2),
          child:Container(
            color: activeIndex==2?Colors.white:Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.computer,size: 20,color: Colors.black,),
                Text('PS4'),
              ],
            )
          ),
        ),
        GestureDetector(
          onTap: ()=>setIndex(3),
          child:Container(
            color: activeIndex==3?Colors.white:Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.computer,size: 20,color: Colors.black,),
                Text('手机游戏'),
              ],
            )
          ),
        ),
      ],
    );
  }
  void setIndex(index){
    setState(() {
      activeIndex = index;
    });
  }
}