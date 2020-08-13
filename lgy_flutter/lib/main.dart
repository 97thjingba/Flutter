import 'package:flutter/material.dart';
import 'controller/LaiWan.dart';
import './Report.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(backgroundColor: Colors.pink, title: Text('来玩管理平台')),
          body: new LaiWan(),
        ),
        routes: {
          "report": (context) => Report(),
        });
  }
}
