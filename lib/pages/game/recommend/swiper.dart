import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class RecommendSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: Swiper(
        itemBuilder: _swiperBuilder,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        loop:false,
        onTap: (index) => print('点击了第$index个'),
        viewportFraction: 0.90,
        scale: 0.95,
    ));
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child:Image(
            fit: BoxFit.cover,
            image: AssetImage(['images/title.png','images/csgo.png','images/d2.png','images/lol.png','images/pubg.png','images/r6.png'][index%6]),
          ),
        ),
        Positioned(
          bottom: 40,
          child: Text("Steam冬季 热销商品！",style: TextStyle(fontSize: 22,color: Colors.white),),
        ),
        Positioned(
          bottom: 20,
          child: Text("买买买",style: TextStyle(fontSize: 16,color: Colors.white),),
        ),
      ],
    );
  }
}