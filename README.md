# flutter_app
模仿小黑盒的flutter练手项目

# 遇到的问题及解决方案
1、Navigator.push跳转到子页面的时候底部导航栏依然存在:
- 不能在导航栏的页面中使用MaterialApp,跳转时会认为是同级别的

2、切换tab栏保持状态:
- 在组件后加上 
$ with AutomaticKeepAliveClientMixin
- 并且重写方法
$ @override
$ bool get wantKeepAlive => true;//切换保留tab状态