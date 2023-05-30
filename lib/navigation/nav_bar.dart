import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://elements-video-cover-images-0.imgix.net/files/220512242/Preview.jpg?auto=compress&crop=edges&fit=crop&fm=jpeg&h=800&w=1200&s=3702b1eeb3ed39c89cbef83a0ec2e371"),
                    fit: BoxFit.cover)),
            accountName: const Text(
              "Egemen Sevgi",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "AppFontBold",
              ),
            ),
            accountEmail: Text(
              "egemensvg@gmail.com",
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontFamily: "AppFont",
                  backgroundColor: Colors.transparent),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Image.network(
                "https://datepsychology.com/wp-content/uploads/2022/09/gigachad.jpg",
                fit: BoxFit.cover,
                width: 90,
                height: 90,
              )),
            ),
          ),
          ListTile(
            onTap: () {
              print("clicked Settings");
            },
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: const Text(
              "Settings",
              style: TextStyle(fontFamily: "AppFont", fontSize: 18),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              print("clicked saved");
            },
            leading: const Icon(
              Icons.bookmark,
              size: 30,
            ),
            title: const Text(
              "Saved",
              style: TextStyle(fontFamily: "AppFont", fontSize: 18),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              print("clicked Policies");
            },
            leading: const Icon(
              Icons.policy,
              size: 30,
            ),
            title: const Text(
              "Policies",
              style: TextStyle(fontFamily: "AppFont", fontSize: 18),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              print("clicked Third party libraries");
            },
            leading: const Icon(
              Icons.library_books,
              size: 30,
            ),
            title: const Text(
              "Third party libraries",
              style: TextStyle(fontFamily: "AppFont", fontSize: 18),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              print("clicked exit_to_app");
            },
            leading: const Icon(
              Icons.exit_to_app,
              size: 30,
            ),
            title: const Text(
              "Exit",
              style: TextStyle(fontFamily: "AppFont", fontSize: 18),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
