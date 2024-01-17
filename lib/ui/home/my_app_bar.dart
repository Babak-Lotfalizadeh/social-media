import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:social_media/ui/home/my_toolbar_icon.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: StaticSize.paddingNormal),
        child: const FlutterLogo(),
      ),
      title: Text(AppLocalizations.of(context)?.appName ?? ''),
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
