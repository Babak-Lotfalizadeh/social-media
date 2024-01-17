import 'package:flutter/material.dart';

class MyBottomNavigationBarItem {
  final String title;
  final IconData iconData;
  final IconData activeIconData;
  final Function() onClick;

  const MyBottomNavigationBarItem({
    required this.iconData,
    required this.activeIconData,
    required this.title,
    required this.onClick,
  });

  BottomNavigationBarItem get item => BottomNavigationBarItem(
        label: title,
        activeIcon: Icon(activeIconData),
        icon: Icon(iconData),
      );
}
