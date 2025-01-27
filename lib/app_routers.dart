import 'package:flutter/material.dart';
import 'package:spend_snap/layouts/mobile.dart';
import 'package:spend_snap/screens/home/index.dart';
import 'package:spend_snap/screens/transactions/index.dart';

class AppRoutes {
  static const String home = '/';
  static const String transactions = '/transactions';
  static const String contact = '/transactions';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => MobileLayout(title: 'SpendSnap', child: HomeScreen()),
    transactions: (context) =>
        MobileLayout(title: 'SpendSnap', child: TransactionScreen()),
  };
}
