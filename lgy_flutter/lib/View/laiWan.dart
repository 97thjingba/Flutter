import 'package:flutter/material.dart';

class LaiWan extends StatefulWidget {
  _LaiWanState createState() => new _LaiWanState();
}

class _LaiWanState extends State {
  String username;
  String password;

  void _checkUsername(value) {
    print('wowow');
    print(value);
  }

  void _checkPassword(value) {
    print(value);
  }

  void _checkTextInput() {
    print('我将要开始检测textInput');
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      color: Colors.blue,
      padding: const EdgeInsets.all(36),
      margin: const EdgeInsets.only(bottom: 36),
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.green,
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
          Container(
              child: Image.asset(
            'images/img_password.png',
            width: 60,
            height: 57,
          ))
        ],
      ),
    );

    Widget userNameSection = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('请输入用户名'),
          TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              onChanged: (value) => _checkUsername(value)),
        ],
      ),
    );

    Widget passwordSection = Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('请输入密码'),
          TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              onChanged: (value) => _checkPassword(value)),
        ],
      ),
    );

    Widget buttonSection = GestureDetector(
      onTap: _checkTextInput,
      child: Image.asset(
        'images/btn_sign_in.png',
        width: 322,
        height: 57,
      ),
    );

    return Container(
      width: 600,
      height: 1000,
      child: Column(
        children: [
          titleSection,
          userNameSection,
          passwordSection,
          buttonSection,
        ],
      ),
    );
  }
}
