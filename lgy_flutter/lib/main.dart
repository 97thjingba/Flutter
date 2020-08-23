import 'package:flutter/material.dart';
import 'package:lgy_flutter/util/feature/SizeConfig.dart';
import 'controller/LaiWan.dart';
import './Profile.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化手机屏幕的大小
    return new MaterialApp(
        title: 'Flutter Demo',
        initialRoute: "logIn",
        routes: {
          "logIn": (context) => LaiWan(),
          "profile": (context) => Profile(),
        });
  }
}
