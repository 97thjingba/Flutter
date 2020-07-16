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
            body: Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue[50],
              child: Align(
                  // widthFactor 代表child里widget所占用的空间的宽度的倍数.heightFactor一样
                  // 如果WidthFactor和父级的width同时存在.则父级的优先级更高
                  // widthFactor: 3,
                  // heightFactor: 3,
                  // alignment: Alignment.topRight,
                  // 实际偏移 = (Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)
                  alignment: FractionalOffset(0.5, 0.5),
                  // 实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
                  // childWidth = 父元素的 width .如果没有.默认为满屏
                  child: FlutterLogo(
                    size: 60,
                  )),
            )));
  }
}
