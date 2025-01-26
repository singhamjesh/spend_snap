import 'package:flutter/material.dart';
import 'package:spend_snap/widgets/bar_chart.dart';

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
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: Icon(
                      Icons.attach_money,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      'Transaction $index', // Replace with your data title
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    subtitle: Text(
                      'Description for transaction $index', // Replace with your data description
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                    ),
                    trailing: Text(
                      '\$${(index + 1) * 10}', // Replace with your data amount
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
