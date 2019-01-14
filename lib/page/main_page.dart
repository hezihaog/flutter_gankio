import 'package:flutter/material.dart';
import 'package:flutter_gankio/constant/gank_constant.dart';
import 'package:flutter_gankio/page/home_page.dart';
import 'package:flutter_gankio/page/mine_page.dart';
import 'package:flutter_gankio/page/welfare_page.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;
  List<Widget> _pages = new List();
  TextStyle _tabTextStyle = new TextStyle(color: APP_COLOR);

  @override
  void initState() {
    //初始化多个Tab页面
    _pages..add(new HomePage())..add(new WelfarePage())..add(new MinePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _pages[_currentPageIndex],
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(
                Icons.home,
                color: APP_COLOR,
              ),
              title: Text(
                MAIN_MODULE_NAME,
                style: _tabTextStyle,
              )),
          new BottomNavigationBarItem(
              icon: new Icon(
                Icons.view_quilt,
                color: APP_COLOR,
              ),
              title: new Text(
                WELFARE_MODULE_NAME,
                style: _tabTextStyle,
              )),
          new BottomNavigationBarItem(
              icon: new Icon(
                Icons.account_box,
                color: APP_COLOR,
              ),
              title: new Text(
                MINE_MODULE_NAME,
                style: _tabTextStyle,
              ))
        ],
        currentIndex: _currentPageIndex,
        onTap: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
