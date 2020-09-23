import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List profileList = [
  {
    "title": '点赞',
    "value": '32',
  },
  {
    "title": '相册',
    "value": '25',
  },
  {
    "title": '评论',
    "value": '67',
  },
  {
    "title": '转发',
    "value": '45',
  },
];

void printScreenInformation() {
  print('设备宽度:${ScreenUtil().screenWidth}'); //Device width
  print('设备高度:${ScreenUtil().screenHeight}'); //Device height
  print('设备的像素密度:${ScreenUtil().pixelRatio}'); //Device pixel density
  print(
    '底部安全区距离:${ScreenUtil().bottomBarHeight}dp',
  ); //Bottom safe zone distance，suitable for buttons with full screen
  print(
    '状态栏高度:${ScreenUtil().statusBarHeight}dp',
  ); //Status bar height , Notch will be higher Unit px

  print('实际宽度的dp与设计稿px的比例:${ScreenUtil().scaleWidth}');
  print('实际高度的dp与设计稿px的比例:${ScreenUtil().scaleHeight}');

  print(
    '宽度和字体相对于设计稿放大的比例:${ScreenUtil().scaleWidth * ScreenUtil().pixelRatio}',
  );
  print(
    '高度相对于设计稿放大的比例:${ScreenUtil().scaleHeight * ScreenUtil().pixelRatio}',
  );
  print('系统的字体缩放比例:${ScreenUtil().textScaleFactor}');

  print(ScreenUtil().scaleWidth); // 实际宽度的dp与设计稿px的比例
  print(ScreenUtil().scaleHeight); // 实际高度的dp与设计稿px的比例
  print(100.h);
  print(100.w);
  print('scale值: ${[
    ScreenUtil().scaleWidth,
    ScreenUtil().scaleHeight
  ].reduce(min)}');
}

final scale = [ScreenUtil().scaleWidth, ScreenUtil().scaleHeight].reduce(min);

class Profile extends StatelessWidget {
  Widget build(BuildContext context) {
    // printScreenInformation();
    return Scaffold(
      body: ConstrainedBox(
        // 确保constrainedbox 确保stack占满屏幕，
        constraints: BoxConstraints.expand(),
        child: Stack(
          // 如果没有写定位的话. child就在居中显示
          alignment: Alignment.center,
          children: [
            // 渲染层级和react-native一样. 约在下面的会覆盖掉上层的东西
            backgroundSection(),
            userInfo(),
            avatar(),
          ],
        ),
      ),
    );
  }
}

Widget avatar() {
  return Positioned(
    top: 140.h,
    left: 40.w,
    child: CircleAvatar(
      // 图片大小
      radius: 50 * scale,
      backgroundImage: AssetImage('images/profile/avatar.jpeg'),
    ),
  );
}

Widget backgroundSection() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/profile/background.png'),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget userInfo() {
  return Positioned(
    top: 200.h,
    child: Container(
      padding: EdgeInsets.only(left: 50.w, top: 50.h, right: 50.w),
      width: 1.wp,
      height: 1.hp,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userName(),
          tagsContainer(),
          userStatus(),
        ],
      ),
    ),
  );
}

Widget userStatus() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: profileList.map((item) {
        return Container(
          margin: EdgeInsets.only(right: 10.w),
          child: Column(
            children: [
              Text(
                item['value'],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                item['title'],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
        );
      }).toList());
}

Widget userName() {
  return Text(
    'Peking',
    style: TextStyle(
      color: Colors.black87,
      fontSize: 30.sp,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget tagsContainer() {
  return Container(
    margin: EdgeInsets.only(top: 20.h, bottom: 50.h),
    child: Wrap(
      spacing: 30.w, // 主轴(水平)方向间距
      runSpacing: 2.h, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向居中
      children: [
        tag('95后'),
        tag('天蝎座'),
        tag('四川 成都'),
      ],
    ),
  );
}

Widget tag(String title) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    decoration: BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: Text(
      title,
      style: TextStyle(
        color: Colors.black38,
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
