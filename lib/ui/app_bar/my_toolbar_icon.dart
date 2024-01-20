import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';

class MyToolbarIcon extends StatelessWidget {
  final IconData iconData;
  final Function() onPressed;

  const MyToolbarIcon({
    required this.iconData,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        iconData,
        size: StaticSize.iconSizeSmall,
      ),
    );
  }
}
