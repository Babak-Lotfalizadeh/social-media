import 'package:flutter/material.dart';
import 'package:social_media/ui/app_bar/my_toolbar_icon.dart';
import 'package:social_media/ui/public/app_icon.dart';
import 'package:social_media/utils/export.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: StaticSize.paddingNormal),
        child: const AppIcon(),
      ),
      title: Text(
        AppLocalizations.of(context)?.appName ?? '',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      titleSpacing: StaticSize.paddingNormal,
      leadingWidth: StaticSize.iconSizeNormal,
      actions: [
        MyToolbarIcon(
          iconData: Icons.add_box_outlined,
          onPressed: () {},
        ),
        MyToolbarIcon(
          iconData: Icons.favorite_border,
          onPressed: () {},
        ),
        MyToolbarIcon(
          iconData: Icons.message_outlined,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
