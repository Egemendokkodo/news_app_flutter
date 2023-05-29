import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news_app_flutter/view/home_page.dart';
import 'package:news_app_flutter/view/search_page.dart';
import 'package:news_app_flutter/view/profile_page.dart';

/*class Tabbar extends StatefulWidget {
  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            this._selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 20,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
              size: 25,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 25,
            ),
            label: "",
          ),
        ],
      ),
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
}*/
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
              onTabChange: (index) {
                setState(() {
                  this._selectedTab = index;
                });
              },
              selectedIndex: _selectedTab,
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
                ),
                GButton(
                  iconColor: Colors.black,
                  icon: Icons.search,
                  text: "Search",
                ),
                GButton(
                  iconColor: Colors.black,
                  icon: Icons.person,
                  text: "Profile",
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
