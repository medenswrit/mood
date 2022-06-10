import 'package:flutter/material.dart';
import 'package:mood/pages/base/tabs/analysis/analysis_page.dart';
import 'package:mood/pages/base/tabs/daily/daily_page.dart';
import 'package:mood/pages/base/tabs/home/home_page.dart';

class TabItem {
  final Widget icon;
  final Widget selectedIcon;
  final String name;
  final String route;

  TabItem(
      {required this.selectedIcon,
      required this.icon,
      required this.name,
      required this.route});
}

class BottomNavigation extends StatefulWidget {
  static final tabs = [
    TabItem(
      selectedIcon: const Icon(Icons.content_paste),
      icon: const Icon(Icons.content_paste),
      name: DailyPage.pageName,
      route: DailyPage.routeName,
    ),
    TabItem(
      selectedIcon: const Icon(Icons.content_paste),
      icon: const Icon(Icons.home_mini_sharp),
      name: HomePage.pageName,
      route: HomePage.routeName,
    ),
    TabItem(
      selectedIcon: const Icon(Icons.content_paste),
      icon: const Icon(Icons.auto_graph),
      name: AnalysisPage.pageName,
      route: AnalysisPage.routeName,
    ),
  ];

  const BottomNavigation(
      {Key? key, required this.currentTab, required this.onTapped})
      : super(key: key);
  final int currentTab;
  final ValueChanged<int> onTapped;

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentTab,
      items: BottomNavigation.tabs.map((tab) {
        return BottomNavigationBarItem(
            icon: tab.icon, label: tab.name, activeIcon: tab.selectedIcon);
      }).toList(),
      type: BottomNavigationBarType.fixed,
      onTap: (index) => widget.onTapped(index),
    );
  }
}
