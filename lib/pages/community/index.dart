import 'package:flutter/material.dart';

class Community extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return ScaleAnimationRoute1();
  }
}


class ScaleAnimationRoute1 extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute1>
    with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 1), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: GestureDetector(
        onTap: ()=>controller.stop(),
        child:Container(
          width: 40,
          height: 40,
          color: Colors.red,
        ),
      ),
      builder: (BuildContext ctx, Widget child) {
        return new Positioned(
          left: animation.value, 
          top: animation.value, 
          child: child,
        );
      },
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}