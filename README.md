# flutter_app
模仿小黑盒的flutter练手项目

# 遇到的问题及解决方案
1、Navigator.push跳转到子页面的时候底部导航栏依然存在:
- 不能在导航栏的页面中使用MaterialApp,跳转时会认为是同级别的

2、切换tab栏保持状态:
``` bash
$ class BarState extends State<Bar> with AutomaticKeepAliveClientMixin {
$   @override
$   bool get wantKeepAlive => true;//切换保留tab状态
$ }
```
