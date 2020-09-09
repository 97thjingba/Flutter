import 'package:flutter/material.dart';
import 'controller/LaiWan.dart';
import './Profile.dart';
import './Ceiling.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化手机屏幕的大小
    return new MaterialApp(
        title: 'Flutter Demo',
        initialRoute: "ceiling",
        routes: {
          "logIn": (context) => LaiWan(),
          "profile": (context) => Profile(),
          "ceiling": (context) => Ceiling(),
        });
  }
}
