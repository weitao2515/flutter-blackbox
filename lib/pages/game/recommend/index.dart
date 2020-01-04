import 'package:flutter/material.dart';
import './swiper.dart';
import './option.dart';
import './recommend_content.dart';

class Recommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        RecommendSwiper(),
        RecommendOption(),
        RecommendContent(),
      ],
    );
  }
}