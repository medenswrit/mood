import 'package:flutter/material.dart';
import 'package:mood/pages/base/bottom_nav.dart';
import 'package:mood/pages/base/common/nav/menu.dart';
import 'package:mood/router.dart';

class BasePage extends StatefulWidget {
  static const routeName = '/base';
  static const pageName = 'Base';

  const BasePage({Key? key}) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState extends State<BasePage> {
  int _currentTab = 1;
  final PageController _pageController = PageController(initialPage: 1);
  final GlobalKey<BottomNavigationState> _bottomNavState =
      GlobalKey<BottomNavigationState>();

  void _onTapped(int index) {
    if (index != _currentTab) {
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(BottomNavigation.tabs[_currentTab].name),
          actions: <Widget>[
            Menu.buildMenu(context),
          ],
        ),
        body: PageView(
          onPageChanged: onPageChanged,
          controller: _pageController,
          children: BottomNavigation.tabs.map((tab) {
            return Navigator(
              // key: tab.nav,
              onGenerateRoute: MoodRouter.generateRoute,
              initialRoute: tab.route,
            );
          }).toList(),
        ),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onTapped: _onTapped,
          key: _bottomNavState,
        ),
      ),
    );
  }

  void onPageChanged(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  void goHome() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
