import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/news.dart';

class NewsList extends StatefulWidget {
  NewsList({Key key, this.type}) : super(key: key);
  final type;
  @override
  State<StatefulWidget> createState() => new NewsListState();
}

class NewsListState extends State<NewsList> with AutomaticKeepAliveClientMixin{
  var news = newsList;
  @override
  void initState() {
    super.initState();
  }
  @override
  bool get wantKeepAlive => true;//切换保留tab状态
  @override
  Widget build(BuildContext context){
    super.build(context);
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        if(index==news.length-1){
          addNews();
          return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(strokeWidth: 2.0)
              ),
            );
        }
        if (widget.type==0) {
          return index==0?TitleNews(category:index%6):ContentNews(category:index%6);
        } else {
          return ContentNews(category:widget.type);
        }
      },
    );
  }
  void addNews(){
    Future.delayed(Duration(seconds: 1), (){
      if (mounted){ //判断页面是否存在
        setState(() {
          news+=newsList;
        });
      }
    });
  }
}

class TitleNews extends StatelessWidget{
  TitleNews({Key key, this.category}) : super(key: key);
  final category;
  @override
  Widget build(BuildContext context){
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5, 8, 5, 0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width/1.78,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage(newsList[category].image),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 15,
            width: MediaQuery.of(context).size.width-20,
            child:Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(newsList[category].title,
                style: TextStyle(fontSize: 22,color: Colors.white,wordSpacing:0.5),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Row(
              children: <Widget>[
                Text('Tato:2小时前',style: TextStyle(fontSize: 15,color: Colors.grey[100])),
              ],
            ),
          ),
        ],
    );
  }
}

class ContentNews extends StatelessWidget{
  ContentNews({Key key, this.category}) : super(key: key);
  final category;
  @override
  Widget build(BuildContext context){
    final width = MediaQuery.of(context).size.width-10;
    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
      width: width,
      height: width/4,
      decoration: BoxDecoration(
        border: Border(bottom:BorderSide(width: 1,color: Colors.grey[300]))
      ),
      child: Row(
        children: <Widget>[
          Container(
            width:width*0.6,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Text(newsList[category].title,style: TextStyle(fontSize: 17,wordSpacing:0.5),
                  maxLines: 2,overflow: TextOverflow.ellipsis,),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Tato,2小时前'),
                      Row(
                        children: <Widget>[
                          Icon(Icons.message,size: 15,),
                          Text(newsList[category].comment)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Image(
            height: width/4,
            width: width*0.4,
            fit: BoxFit.cover,
            image: AssetImage(newsList[category].image),
          ),
        ],
      ),
    );
  }
}