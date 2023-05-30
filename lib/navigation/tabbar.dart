import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app_flutter/view/home_page.dart';
import 'package:news_app_flutter/view/search_page.dart';
import 'package:news_app_flutter/view/profile_page.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          renderView(
            0,
            const HomePage(),
          ),
          renderView(
            1,
            const SearchPage(),
          ),
          renderView(
            2,
            const ProfilePage(),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
          child: GNav(
              duration: Duration(milliseconds: 600),
              onTabChange: (index) {
                setState(() {
                  this._selectedTab = index;
                });
              },
              color: Colors.white,
              rippleColor: Colors.white,
              hoverColor: Colors.white,
              tabBorder: Border.all(color: Colors.white, width: 1),
              tabShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
              ],
              selectedIndex: _selectedTab,
              tabBackgroundColor: Colors.white,
              tabActiveBorder: Border.all(color: Colors.black, width: 1),
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.white,
              activeColor: Colors.black,
              gap: 8,
              tabs: const [
                GButton(
                  iconColor: Colors.black,
                  icon: Icons.home,
                  text: "Home",
                  textStyle: TextStyle(fontFamily: "AppFontBold"),
                ),
                GButton(
                  iconColor: Colors.black,
                  icon: Icons.search,
                  text: "Search",
                  textStyle: TextStyle(fontFamily: "AppFontBold"),
                ),
                GButton(
                  iconColor: Colors.black,
                  icon: Icons.person,
                  text: "Profile",
                  textStyle:
                      TextStyle(fontFamily: "AppFontBold", letterSpacing: 0.1),
                )
              ]),
        ),
      ),
    );
  }

  Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: _selectedTab != tabIndex,
      child: Opacity(
        opacity: _selectedTab == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}
