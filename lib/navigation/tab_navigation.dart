import 'package:flutter/material.dart';
import 'package:fluttermytrip/pages/home_page.dart';
import 'package:fluttermytrip/pages/my_page.dart';
import 'package:fluttermytrip/pages/search_page.dart';
import 'package:fluttermytrip/pages/travel_page.dart';


class TabNavigation extends StatefulWidget {
  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  final _defaultColor = Colors.grey;
  final _activityColor = Colors.blue;
  int _currentIndex = 0;

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: _activityColor,
          unselectedItemColor: _defaultColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text(
                  "首页",
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                title: Text(
                  "搜索",
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.camera_alt,
                ),
                title: Text(
                  "旅拍",
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: _defaultColor,
                ),
                title: Text(
                  "我的",
                )),
          ]),
    );
  }
}
