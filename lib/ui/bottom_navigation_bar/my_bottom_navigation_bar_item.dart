import 'package:flutter/material.dart';

class MyBottomNavigationBarItem {
  final String title;
  final IconData iconData;
  final IconData activeIconData;

  const MyBottomNavigationBarItem({
    required this.iconData,
    required this.activeIconData,
    required this.title,
  });

  BottomNavigationBarItem get item => BottomNavigationBarItem(
        label: title,
        activeIcon: Icon(activeIconData),
        icon: Icon(iconData),
      );
}
