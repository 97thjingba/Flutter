import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(36),
      margin: const EdgeInsets.only(bottom: 36),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  child: Text(
                    '欢迎登陆来玩',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Container(
              child: Image.asset(
            'images/img_password.png',
            width: 60,
            height: 57,
          ))
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget inputSection = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              width: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('中国大陆'),
                  TextField(
                    keyboardType: TextInputType.number,
                  ),
                ],
              )),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('请输入手机号'),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
              ),
            ],
          ))
        ],
      ),
    );

    Widget buttonSection = Container(
      padding: const EdgeInsets.all(32),
      child: Image.asset(
        'images/btn_sign_in.png',
        width: 322,
        height: 57,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: Text('LaiWan LogIn'),
          ),
          body: Container(
            width: 600,
            height: 1000,
            child: Column(
              children: [
                titleSection,
                inputSection,
                buttonSection,
              ],
            ),
          )),
    );
  }
}
