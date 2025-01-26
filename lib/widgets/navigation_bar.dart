import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    super.key,
    required this.onMenuTapped,
    required this.selectedIndex,
  });

  final ValueChanged<int> onMenuTapped;
  final int selectedIndex;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isIOS = theme.platform == TargetPlatform.iOS;

    return isIOS
        ? _buildCupertinoTabBar()
        : _buildMaterialBottomNavigationBar();
  }

  Widget _buildMaterialBottomNavigationBar() {
    return BottomNavigationBar(
      items: _buildBottomNavigationBarItems(
          Icons.home, Icons.add, Icons.more_vert),
      currentIndex: widget.selectedIndex,
      onTap: widget.onMenuTapped,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      unselectedItemColor: Theme.of(context).colorScheme.primary,
      backgroundColor:
          Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
      type: BottomNavigationBarType.fixed,
    );
  }

  Widget _buildCupertinoTabBar() {
    return CupertinoTabBar(
      items: _buildBottomNavigationBarItems(
          CupertinoIcons.home, CupertinoIcons.add, CupertinoIcons.ellipsis),
      currentIndex: widget.selectedIndex,
      onTap: widget.onMenuTapped,
      activeColor: Theme.of(context).colorScheme.secondary,
      inactiveColor: Theme.of(context).colorScheme.primary,
      backgroundColor:
          Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems(
      IconData homeIcon, IconData addIcon, IconData moreIcon) {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: widget.selectedIndex == 0
                ? Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5)
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(homeIcon),
        ),
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: widget.selectedIndex == 1
                ? Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5)
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(addIcon),
        ),
      ),
      BottomNavigationBarItem(
        icon: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: widget.selectedIndex == 2
                ? Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5)
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Icon(moreIcon),
        ),
      ),
    ];
  }
}
