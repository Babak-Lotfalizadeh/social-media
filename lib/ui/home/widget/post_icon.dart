import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';

class PostIcon extends StatelessWidget {
  const PostIcon({
    required this.onPressed,
    required this.iconData,
    super.key,
  });

  final IconData iconData;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        size: StaticSize.iconSizeSmall,
      ),
    );
  }
}
