import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:swish/pages/camera.dart';
import 'package:swish/pages/catalogue.dart';
import 'package:swish/pages/postnsearch.dart';
import 'package:swish/pages/profile.dart';

import 'notification.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = <Widget>[
    Icon(Icons.shop),
    Icon(Icons.notifications),
    Icon(Icons.camera),
    Icon(Icons.add),
    Icon(Icons.person)
  ];
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.jumpToPage(pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        children: [
          Catalogue(),
          Notifications(),
          Camera(),
          PostnSearch(),
          Profile(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: onTap,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOutBack,
        animationDuration: Duration(milliseconds: 400),
        height: 40,
        items: items,
      ),
    );
  }
}
