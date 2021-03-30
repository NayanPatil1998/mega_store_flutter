import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:mega_store/widgets/DefaultAppbar.dart';
import 'package:mega_store/widgets/DraweWidget.dart';
import 'package:mega_store/widgets/HomeComponents/HomeScreen.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // PersistentTabController _controller =
  //     PersistentTabController(initialIndex: 0);
  // List<Widget> _buildScreens() {
  //   return [HomeScreen(), Container(), Container(), Container()];
  // }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.home),
  //       title: ("Home"),
  //       textStyle: TextStyle(fontWeight: FontWeight.bold),
  //       activeColorPrimary: CupertinoColors.black,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(FontAwesome.tag),
  //       title: ("Settings"),
  //       activeColorPrimary: CupertinoColors.black,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.cart),
  //       title: ("Settings"),
  //       activeColorPrimary: CupertinoColors.black,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //     PersistentBottomNavBarItem(
  //       icon: Icon(CupertinoIcons.person),
  //       title: ("Settings"),
  //       activeColorPrimary: CupertinoColors.black,
  //       inactiveColorPrimary: CupertinoColors.systemGrey,
  //     ),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Vx.white,
        drawer: DrawerWidget(),
        appBar: defaulttAppbar("MEGA STORE", true),
        body: HomeScreen()
        // PersistentTabView(
        //   context,
        //   controller: _controller,
        //   screens: _buildScreens(),
        //   items: _navBarsItems(),
        //   confineInSafeArea: true,
        //   backgroundColor: Colors.white, // Default is Colors.white.
        //   handleAndroidBackButtonPress: true, // Default is true.
        //   resizeToAvoidBottomInset:
        //       true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        //   stateManagement: true, // Default is true.
        //   hideNavigationBarWhenKeyboardShows:
        //       true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        //   decoration: NavBarDecoration(
        //     borderRadius: BorderRadius.circular(10.0),
        //     colorBehindNavBar: Colors.black,
        //   ),
        //   popAllScreensOnTapOfSelectedTab: true,
        //   popActionScreens: PopActionScreensType.all,
        //   itemAnimationProperties: ItemAnimationProperties(
        //     // Navigation Bar's items animation properties.
        //     duration: Duration(milliseconds: 200),
        //     curve: Curves.ease,
        //   ),
        //   screenTransitionAnimation: ScreenTransitionAnimation(
        //     // Screen transition animation on change of selected tab.
        //     animateTabTransition: true,
        //     curve: Curves.ease,
        //     duration: Duration(milliseconds: 200),
        //   ),
        //   navBarStyle:
        //       NavBarStyle.style13, // Choose the nav bar style with this property.
        // ),
        );
  }
}
