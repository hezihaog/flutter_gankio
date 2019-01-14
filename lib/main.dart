import 'package:flutter/material.dart';
import 'package:flutter_gankio/constant/gank_constant.dart';
import 'page/main_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: APP_COLOR,
      ),
      home: new MainPage(),
    );
  }
}