import 'package:flutter/material.dart';
import 'package:livo_project/modules/activities/views/activity_view.dart';
import 'package:livo_project/modules/favorites/views/favorite_view.dart';
import 'package:livo_project/modules/home/views/home_view.dart';
import 'package:livo_project/modules/settings/views/setting_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class MainView extends StatelessWidget {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  MainView({super.key});

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const ActivityView(),
      const FavoriteView(),
      const SettingView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Beranda"),
        activeColorPrimary: const Color(0xFFD5671D),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.history),
        title: ("Aktivitas"),
        activeColorPrimary: const Color(0xFFD5671D),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: ("Favorit"),
        activeColorPrimary: const Color(0xFFD5671D),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("Pengaturan"),
        activeColorPrimary: const Color(0xFFD5671D),
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style3, 
    );
  }
}
