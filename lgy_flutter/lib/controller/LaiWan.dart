import 'dart:convert';

import 'package:flutter/material.dart';
import './model/logInModel.dart';
import '../util/SimpleStorage.dart';
import '../constant/StorageKey.dart';

class LaiWan extends StatefulWidget {
  _LaiWanState createState() => new _LaiWanState();
}

class _LaiWanState extends State {
  String _username;
  String _password;

  void _checkUsername(value) {
    _username = value;
  }

  void _checkPassword(value) {
    _password = value;
  }

  void _login() async {
    try {
      var result = await LoginModel.login(_username, _password);
      Map resultMap = json.decode(result);
      // 获取accessToken
      // 这里拿数据需要一个专门处理拿数据的model
      var accessToken = resultMap['result']['access_token'];
      // 存入本地缓存
      Storage.saveString(StorageKey.accessToken, accessToken);
      // 跳转到写好的路由
      Navigator.pushNamed(context, "report");
    } catch (error) {
      print(error);
    }
  }

  void _checkTextInput() {
    if (_username.isEmpty || _password.isEmpty) {
      print('有空');
      return;
    }
    _login();
  }

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(36),
      margin: const EdgeInsets.only(bottom: 36),
      child: Row(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              obscureText: true,
              autofocus: true,
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
