import 'package:flutter/material.dart';
import 'package:social_media/ui/app_bar/my_toolbar_icon.dart';
import 'package:social_media/ui/public/app_icon.dart';
import 'package:social_media/utils/export.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showAdd;
  final bool showLike;
  final bool showMessage;
  final String? title;
  final bool showAppIcon;

  const MyAppBar({
    this.showAdd = false,
    this.showLike = false,
    this.showMessage = false,
    this.showAppIcon = true,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showAppIcon ? Padding(
        padding: EdgeInsets.only(left: StaticSize.paddingNormal),
        child: const AppIcon(),
      ) : null,
      title: Text(
        title ?? AppLocalizations.of(context)?.appName ?? '',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      centerTitle: false,
      titleSpacing: StaticSize.paddingNormal,
      leadingWidth: StaticSize.iconSizeNormal,
      actions: [
        if (showAdd)
          MyToolbarIcon(
            iconData: Icons.add_box_outlined,
            onPressed: () {},
          ),
        if (showLike)
          MyToolbarIcon(
            iconData: Icons.favorite_border,
            onPressed: () {},
          ),
        if (showMessage)
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
