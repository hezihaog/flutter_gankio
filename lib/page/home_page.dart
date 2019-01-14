import 'package:flutter/material.dart';
import 'package:flutter_gankio/constant/gank_constant.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new HomeTabWidget();
  }
}

class HomeTabWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeTabState();
  }
}

class HomeTabState extends State<HomeTabWidget>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(MAIN_MODULE_NAME),
        bottom: TabBar(controller: _controller, tabs: [
          new Tab(
            text: CATEGORY_ANDROID,
          ),
          new Tab(
            text: CATEGORY_IOS,
          ),
          new Tab(
            text: CATEGORY_WEB,
          )
        ]),
      ),
      body: TabBarView(controller: _controller, children: <Widget>[
        new Center(
          child: new Text(CATEGORY_ANDROID),
        ),
        new Center(
          child: Text(CATEGORY_IOS),
        ),
        new Center(
          child: new Text(CATEGORY_WEB),
        )
      ]),
    );
  }
}
