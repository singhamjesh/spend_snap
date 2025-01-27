import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Update `_selectedIndex` based on the current route name
    String? currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute == '/' && _selectedIndex == 1) return;

    switch (currentRoute) {
      case '/':
        _selectedIndex = 0;
        break;
      default:
        _selectedIndex = -1;
    }
  }

  void _onItemTapped(int index) async {
    if (index == 1) {
      setState(() {
        _selectedIndex = 1;
      });

      // Show Add Transaction popup
      await _showAddTransactionPopup();

      return;
    }

    if (index == 2) {
      // Open side menu from left to right
      Scaffold.of(context).openEndDrawer();
      return;
    }

    setState(() {
      _selectedIndex = index;
    });

    String? routeName;
    switch (index) {
      default:
        routeName = '/';
    }

    Navigator.pushNamed(context, routeName);
  }

  Future<void> _showAddTransactionPopup() async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjust height dynamically
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const Text(
                  "Add New Transaction",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            _selectedIndex = -1;
                          });
                        },
                        child: const Text("Cancel"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle adding transaction logic here
                          Navigator.of(context).pop();
                          setState(() {
                            _selectedIndex = -1;
                          });
                        },
                        child: const Text("Add"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
      bool isSelected = _selectedIndex == index;

      return GestureDetector(
        onTap: () => _onItemTapped(index),
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
