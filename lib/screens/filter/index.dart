import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FlitterScreenState();
}

class _FlitterScreenState extends State<FilterScreen> {
  bool _isCredited = false;
  bool _isDebited = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
          value: _isCredited,
          onChanged: (value) {
            setState(() {
              _isCredited = value;
            });
          },
          title: Text("Credited"),
        ),
        SwitchListTile(
          value: _isDebited,
          onChanged: (value) {
            setState(() {
              _isDebited = value;
            });
          },
          title: Text("Debited"),
        ),
      ],
    );
  }
}
