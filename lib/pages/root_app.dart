import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:budget/pages/daily_page.dart';
import 'package:budget/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setIndex(4);
        },
        backgroundColor: primary,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: getAnimatedNavigation(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: currentIndex,
      children: [
        DailyPage(),
        Center(child: Text("Stats Page")),
        Center(child: Text("Create Budget Page")),
        Center(child: Text("Budget Page")),
        Center(child: Text("Profile Page")),
      ],
    );
  }

  Widget getAnimatedNavigation() {
    List<IconData> iconList = [
      Ionicons.md_calendar,
      Ionicons.md_stats,
      Ionicons.md_wallet,
      Ionicons.ios_person
    ];
    return AnimatedBottomNavigationBar(
      icons: iconList,
      activeIndex: currentIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.smoothEdge,
      leftCornerRadius: 16,
      rightCornerRadius: 16,
      splashColor: secondary,
      activeColor: primary,
      inactiveColor: Colors.black.withOpacity(0.5),
      onTap: (index) {
        setIndex(index);
      },
    );
  }

  setIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }
}
