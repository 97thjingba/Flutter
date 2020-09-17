import 'package:flutter/material.dart';
import './util/feature/SizeConfig.dart';

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

class Profile extends StatelessWidget {
  Widget build(BuildContext context) {
    // 初始化
    SizeConfig().init(context);
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
    top: SizeConfig.bv * 14,
    left: SizeConfig.bh * 5,
    child: CircleAvatar(
      // 图片大小
      radius: 40,
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
    top: SizeConfig.bv * 19,
    child: Container(
      padding: EdgeInsets.only(
          left: SizeConfig.bh * 10,
          top: SizeConfig.bv * 8,
          right: SizeConfig.bh * 10),
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
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
          margin: EdgeInsets.only(right: 10),
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
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget tagsContainer() {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 20),
    child: Wrap(
      spacing: 12.0, // 主轴(水平)方向间距
      runSpacing: 2.0, // 纵轴（垂直）方向间距
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
    padding: EdgeInsets.symmetric(horizontal: SizeConfig.bh * 2),
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
        fontSize: 11,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
