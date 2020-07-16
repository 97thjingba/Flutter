import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget redBox = DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Welcome to Flutter'),
            ),
            body: ConstrainedBox(
              // constrainedBox 用于对子组件添加额外的约束.
              constraints: BoxConstraints(
                  minWidth: double.infinity, //宽度尽可能大
                  minHeight: 50.0 //最小高度为50像素
                  ),
              child: Container(height: 5.0, child: redBox),
            )));
  }
}
