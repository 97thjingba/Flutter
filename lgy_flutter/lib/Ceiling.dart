import 'package:flutter/material.dart';
import 'package:lgy_flutter/WaterFallsFlow.dart';
import 'package:lgy_flutter/util/feature/SizeConfig.dart';
import './Profile.dart';
import './ShortVideo.dart';

class Ceiling extends StatefulWidget {
  @override
  _CeilingPage createState() => _CeilingPage();
}

class _CeilingPage extends State<Ceiling> with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController = new ScrollController();
  TabController _tabController;
  List tabs = ['图片', '点赞'];

  bool showStatusBar = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController.addListener(() {
      final value = _scrollViewController.offset;
      if (value == 0) {
        setState(() {
          showStatusBar = false;
        });
      } else {
        setState(() {
          showStatusBar = true;
        });
      }
    });
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
        // scaffold 下的body内容直接显示appBar前面
        // extendBodyBehindAppBar: true,
        appBar: showStatusBar
            ? AppBar(
                elevation: 1,
                backgroundColor: Colors.white,

                ///设置AppBar透明，必须设置为0
                title: Text('首页'),
              )
            : null,
        // 一个可以嵌套其他可滚动widget的widget
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                primary: true,
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
                        Icons.widgets,
                        color: Colors.blue,
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
            children: [
              WaterFallsFlow(),
              VideoPlayerScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
