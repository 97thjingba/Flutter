import 'package:flutter/material.dart';
import 'controller/LaiWan.dart';
import './Profile.dart';
import './Ceiling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        initialRoute: 'ceiling',
        routes: {
          "logIn": (context) => LaiWan(),
          "profile": (context) => Profile(),
          "ceiling": (context) => Ceiling(),
        });
  }
}
