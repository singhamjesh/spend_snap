import 'package:flutter/material.dart';
import 'package:spend_snap/layouts/mobile.dart';
import 'package:spend_snap/screens/filter/index.dart';
import 'package:spend_snap/screens/home/index.dart';
import 'package:spend_snap/screens/transactions/index.dart';

class AppRoutes {
  static const String home = '/';
  static const String transactions = '/transactions';
  static const String filters = '/filters';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => MobileLayout(
          title: 'Spend Snap',
          isBack: false,
          child: HomeScreen(),
        ),
    transactions: (context) => MobileLayout(
          title: 'Transactions',
          isBack: true,
          child: TransactionScreen(),
        ),
    filters: (context) => MobileLayout(
          title: 'Filters',
          isBack: true,
          child: FilterScreen(),
        ),
  };
}
