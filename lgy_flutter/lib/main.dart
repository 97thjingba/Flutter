import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lgy_flutter/page/home/controllor/home.dart';
import './page/login/controllor/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 设置适配尺寸.根据设计稿中设备的屏幕尺寸.假设Iphone6的尺寸设计
  ScreenUtil.init(designSize: Size(750, 1334), allowFontScaling: false);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化手机屏幕的大小
    return new MaterialApp(
        title: 'Flutter Demo',
        initialRoute: 'logIn',
        routes: {
          "logIn": (context) => LogIn(),
          "home": (context) => HomePage(),
        });
  }
}
