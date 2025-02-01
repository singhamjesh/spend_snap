import 'package:flutter/material.dart';
import 'package:spend_snap/config/constants.dart';
import 'package:spend_snap/screens/transactions/form.dart';

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
      case '/filters':
        _selectedIndex = 2;
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

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 2:
        {
          Navigator.pushNamed(context, '/filters');
        }
      default:
        {
          Navigator.pushReplacementNamed(context, '/');
        }
    }
  }

  Future<void> _showAddTransactionPopup() async {
    await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) {
        return TransactionForm();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: EdgeInsets.only(top: 8),
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
    final items = Constants.bottomNavigationItems;
    return List.generate(items.length, (index) {
      bool isSelected = _selectedIndex == index;
      return GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(8.0),
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
