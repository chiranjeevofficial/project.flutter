import 'package:course/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewDrawer extends StatelessWidget {
  const NewDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurpleAccent,
        child: ListView(
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent
                ),
                accountName: Text("chiranjeevofficial"),
                accountEmail: Text("chiranjeev@google.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/male.png"),
                ),
              ),
            ),
            ListTile(
              onTap: () => {
                Navigator.pushNamed(context, NewRoute.dashboardRoute),
              },
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Mail",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () => {
                Navigator.pushNamed(context, NewRoute.loginRoute)
              },
              leading: const Icon(
                CupertinoIcons.lock,
                color: Colors.white,
              ),
              title: const Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}