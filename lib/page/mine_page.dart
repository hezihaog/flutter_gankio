import 'package:flutter/material.dart';
import 'package:flutter_gankio/constant/gank_constant.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(MINE_MODULE_NAME),
      ),
      body: new Center(
        child: new Text(MINE_MODULE_NAME),
      ),
    );
  }
}
