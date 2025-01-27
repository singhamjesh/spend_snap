import 'package:flutter/material.dart';
import 'package:spend_snap/widgets/bar_chart.dart';
import 'package:spend_snap/widgets/form_elements/dropdown.dart';
import 'package:spend_snap/widgets/list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            child: Dropdown(
              name: 'view',
              initialValue: 'monthly',
              items: [
                DropdownItem(label: 'Daily', value: 'daily'),
                DropdownItem(label: 'Monthly', value: 'monthly'),
                DropdownItem(label: 'Yearly', value: 'yearly')
              ],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 5),
            child: SizedBox(
              height: 200,
              child: CustomBarChart(),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last 5 transactions',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/transactions');
                },
                child: Text('See all'),
              )
            ],
          ),
          SizedBox(height: 2),
          Expanded(
            child: CustomList(),
          ),
        ],
      ),
    );
  }
}
