import 'package:flutter/material.dart';
import 'package:spend_snap/screens/home/index.dart';
import 'package:spend_snap/widgets/navigation_bar.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key, required this.title});

  final String title;

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('Add Screen'),
    Text('More Screen'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigation(
        onMenuTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
