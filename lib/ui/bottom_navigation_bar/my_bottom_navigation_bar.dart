import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/ui/bottom_navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:social_media/ui/bottom_navigation_bar/bloc/bottom_navigation_event.dart';
import 'package:social_media/ui/bottom_navigation_bar/bloc/bottom_navigation_state.dart';

import 'my_bottom_navigation_bar_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) => BottomNavigationBar(
        currentIndex: state.value,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color,
        ),
        unselectedIconTheme: IconThemeData(
          color: Theme.of(context).iconTheme.color?.withOpacity(0.8),
        ),
        onTap: (value) => context.read<BottomNavigationBloc>().add(
          BottomNavigationChangeValue(
            newValue: value,
          ),
        ),
        items: [
          MyBottomNavigationBarItem(
            iconData: Icons.home_outlined,
            activeIconData: Icons.home_filled,
            title: appLocalizations?.home ?? '',
          ).item,
          MyBottomNavigationBarItem(
            iconData: Icons.search_outlined,
            activeIconData: Icons.saved_search,
            title: appLocalizations?.search ?? '',
          ).item,
          MyBottomNavigationBarItem(
            iconData: Icons.play_circle_outline,
            activeIconData: Icons.play_circle_fill,
            title: appLocalizations?.play ?? '',
          ).item,
          MyBottomNavigationBarItem(
            iconData: Icons.account_circle_outlined,
            activeIconData: Icons.account_circle_rounded,
            title: appLocalizations?.profile ?? '',
          ).item,
        ],
      ),
    );
  }
}
