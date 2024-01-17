import 'package:flutter/material.dart';

import 'my_bottom_navigation_bar_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).iconTheme.color,
      ),
      unselectedIconTheme: IconThemeData(
        color: Theme.of(context).iconTheme.color?.withOpacity(0.8),
      ),
      items: [
        MyBottomNavigationBarItem(
          iconData: Icons.home_outlined,
          activeIconData: Icons.home_filled,
          title: appLocalizations?.home ?? '',
          onClick: () {},
        ).item,
        MyBottomNavigationBarItem(
          iconData: Icons.search_outlined,
          activeIconData: Icons.search,
          title: appLocalizations?.search ?? '',
          onClick: () {},
        ).item,
        MyBottomNavigationBarItem(
          iconData: Icons.play_circle_outline,
          activeIconData: Icons.play_circle_fill,
          title: appLocalizations?.play ?? '',
          onClick: () {},
        ).item,
        MyBottomNavigationBarItem(
          iconData: Icons.account_circle_outlined,
          activeIconData: Icons.account_circle_rounded,
          title: appLocalizations?.profile ?? '',
          onClick: () {},
        ).item,
      ],
    );
  }
}
