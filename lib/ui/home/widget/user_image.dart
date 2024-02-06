import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    required this.imageAddress,
    super.key,
  });

  final String imageAddress;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(500),
      ),
      child: Image.network(
        imageAddress,
        height: StaticSize.userIcon,
        width: StaticSize.userIcon,
        fit: BoxFit.cover,
      ),
    );
  }
}
