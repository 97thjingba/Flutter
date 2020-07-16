import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
          ),
          body: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
              fit: StackFit.expand, // 未定位widget占满Stack整个空间
              // Stack 里面的东西是层叠的. 下一项会覆盖上一项.相当于 绝对定位
              children: <Widget>[
                Container(
                  child: Text("Hello world",
                      style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                ),
                Positioned(
                  left: 18.0,
                  child: Text("I am Jack"),
                ),
                Positioned(
                  top: 18.0,
                  child: Text("Your friend"),
                )
              ],
            ),
          ),
        ));
  }
}
