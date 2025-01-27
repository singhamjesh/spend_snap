import 'package:flutter/material.dart';
import 'package:spend_snap/app_routers.dart';
import 'package:spend_snap/widgets/navigation_bar.dart';

class MobileLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const MobileLayout({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    bool isHome = ModalRoute.of(context)?.settings.name == AppRoutes.home;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: !isHome,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'Side Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings tapped')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out')),
                );
              },
            ),
          ],
        ),
      ),
      body: child,
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
