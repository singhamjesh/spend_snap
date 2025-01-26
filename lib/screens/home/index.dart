import 'package:flutter/material.dart';
import 'package:spend_snap/widgets/bar_chart.dart';
import 'package:spend_snap/widgets/list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedValue = 'daily';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: DropdownButton<String>(
                value: _selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue = newValue!;
                  });
                },
                items: <String>['daily', 'monthly', 'yearly']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                dropdownColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 250,
              child: CustomBarChart(),
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Last 5 transactions',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  decoration: TextDecoration.underline,
                ),
          ),
          SizedBox(height: 4),
          Expanded(
            child: CustomList(),
          ),
        ],
      ),
    );
  }
}
