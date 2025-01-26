import 'package:flutter/material.dart';

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
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.only(top: 16),
      child: SafeArea(
        bottom: true,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildNavigationItems(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildNavigationItems() {
    final List<Map<String, dynamic>> items = [
      {"icon": Icons.home, "label": "Home"},
      {"icon": Icons.add, "label": "Add"},
      {"icon": Icons.more_vert, "label": "More"},
    ];

    return List.generate(items.length, (index) {
      final isSelected = widget.selectedIndex == index;

      return GestureDetector(
        onTap: () => widget.onMenuTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.white : Colors.transparent,
              ),
              child: Icon(
                items[index]['icon'],
                size: 28,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              items[index]['label'],
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    });
  }
}
