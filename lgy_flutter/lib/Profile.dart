import 'package:flutter/material.dart';
import './util/feature/SizeConfig.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        // 确保constrainedbox 确保stack占满屏幕，
        constraints: BoxConstraints.expand(),
        child: Stack(
          // 如果没有写定位的话. child就在居中显示
          alignment: Alignment.center,
          children: [
            backgroundSection,
            userInfo,
            avatar,
          ],
        ),
      ),
    );
  }

  Widget backgroundSection = Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/profile/background.png'),
        fit: BoxFit.cover,
      ),
    ),
  );

  Widget userInfo = Positioned(
    top: SizeConfig.bv * 23,
    child: Container(
      padding:
          EdgeInsets.only(left: SizeConfig.bh * 10, top: SizeConfig.bv * 8),
      width: SizeConfig.screenWidth,
      height: SizeConfig.bv * 30,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Peking',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );

  Widget avatar = Positioned(
    top: SizeConfig.bv * 20,
    left: SizeConfig.bh * 10,
    child: CircleAvatar(
      // 图片大小
      radius: 40,
      backgroundImage: AssetImage('images/profile/avatar.jpeg'),
    ),
  );
}
