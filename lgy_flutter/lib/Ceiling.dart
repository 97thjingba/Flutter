import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lgy_flutter/util/feature/SizeConfig.dart';
import './Profile.dart';

class Ceiling extends StatefulWidget {
  @override
  _CeilingPage createState() => _CeilingPage();
}

class _CeilingPage extends State<Ceiling> with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;
  List tabs = ['图片', '点赞'];

  @override
  void initState() {
    super.initState();
    // _scrollViewController = ScrollController(initialScrollOffset: 0.0);
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Theme(
      data: ThemeData(primaryColor: Colors.white),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text("首页"),
        ),
        body: NestedScrollView(
          // controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                primary: false,
                // appBar收缩到最小高度的时候appBar是否可见
                pinned: true,
                // floating true的时候下滑appBar优先滑动展示,展示完成后才给滑动控件滑动
                floating: true,
                // appBar 展开时候的高度
                expandedHeight: SizeConfig.bv * 50,
                flexibleSpace: FlexibleSpaceBar(
                  // CollapseMode.none 背景不随着滚动
                  // CollapseMode.parallax 背景滚动具有视差效果
                  // CollapseMode.pin 背景随着滚动，并且手指松开的时候根据松开位置进行展开收缩 AppBar
                  collapseMode: CollapseMode.parallax,
                  background: Profile(),
                ),
                bottom: TabBar(
                  // 下划线的颜色
                  indicatorColor: Colors.brown,
                  // 下划线的高度
                  indicatorWeight: 2.0,
                  // 下划线的size.根据lavel大小显示
                  indicatorSize: TabBarIndicatorSize.label,
                  // 选中的边框
                  // indicator: BoxDecoration(
                  //     border: Border.all(
                  //   width: 2,
                  // )),
                  controller: _tabController,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 24.0,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.access_alarm_outlined,
                        color: Colors.green,
                        size: 24.0,
                      ),
                    )
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: tabs.map((item) {
              return Text(
                item,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  // Widget _buildBanner() {
  //   return Container(
  //     margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
  //     height: 144,
  //     child: Swiper(//第三方的banner库：flutter_swiper
  //         itemBuilder: (BuildContext context, int index) {
  //           return Container(
  //             width: double.infinity,
  //             height: 144,
  //             child: Image.network(
  //               "https://github.com/best-flutter/flutter_swiper/raw/master/banner.jpg",
  //               height: double.infinity,
  //               fit: BoxFit.fill,
  //             ),
  //           );
  //         },
  //         itemCount: 3,
  //         scale: 0.9,
  //         pagination: new SwiperPagination()),
  //   );
  // }

  //banner下面的按钮
  Widget _buildButtons() {
    return Expanded(
      child: Row(
        children: <Widget>[
          _buildButtonItem(Icons.chat, "xxxx"),
          Image.asset("assets/images/phone_flow_chart_arrow.png", height: 8),
          _buildButtonItem(Icons.pages, "xxxx"),
          Image.asset("assets/images/phone_flow_chart_arrow.png", height: 8),
          _buildButtonItem(Icons.phone_android, "xxxx"),
          Image.asset("assets/images/phone_flow_chart_arrow.png", height: 8),
          _buildButtonItem(Icons.print, "xxxx"),
        ],
      ),
    );
  }

  Widget _buildButtonItem(IconData icon, String text) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 28.0),
        Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Text(text,
              style: TextStyle(color: Color(0xff999999), fontSize: 12)),
        )
      ],
    ));
  }

  Widget _buildTabBarBg() {
    return Container(
      //TabBar圆角背景颜色
      height: 50,
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          child: Container(color: Colors.white)),
    );
  }

  Widget _buildListView(String s) {
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) => Divider(
              color: Colors.grey,
              height: 1,
            ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              color: Colors.white,
              child: ListTile(title: Text("$s第$index 个条目")));
        });
  }
}
