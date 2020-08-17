import 'package:flutter/material.dart';
import 'controller/LaiWan.dart';
import './Profile.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        initialRoute: "logIn",
        routes: {
          "logIn": (context) => LaiWan(),
          "profile": (context) => Profile(),
        });
  }
}
