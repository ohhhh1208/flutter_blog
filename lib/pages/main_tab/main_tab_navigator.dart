import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'mine_page.dart';

class MainTabNavigator extends StatefulWidget {
  const MainTabNavigator({Key? key}) : super(key: key);

  @override
  State<MainTabNavigator> createState() => _MainTabNavigatorState();
}

class _MainTabNavigatorState extends State<MainTabNavigator> {
  var titles = ["首页", "我的"];
  List<Widget> pages = <Widget>[const HomePage(), const MinePage()];

  var _pageController = PageController();
  int _selectedIndex = 0;
  DateTime? _lastPressed;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressed == null || DateTime.now().difference(_lastPressed!) > const Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressed = DateTime.now();
            return false;
          }
          return true;
        },
        child: PageView.builder(
          itemBuilder: (ctx, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: titles[0],
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.format_list_bulleted),
          //   label: S.of(context).tabProject,
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.group_work),
          //   label: S.of(context).wechatAccount,
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.call_split),
          //   label: S.of(context).tabStructure,
          // ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.insert_emoticon),
            label: titles[1],
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
