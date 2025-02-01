import 'package:flutter/material.dart';

class Constants {
  static const appName = "Spend Snap";
  static const appTitle = "Budget";

  static final List<Map<String, dynamic>> bottomNavigationItems = [
    {"icon": Icons.home, "label": "Home"},
    {"icon": Icons.add_circle_outline_rounded, "label": "Add"},
    {"icon": Icons.filter, "label": "Filter"},
  ];
}
