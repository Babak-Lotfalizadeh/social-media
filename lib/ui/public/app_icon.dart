import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double? size;

  const AppIcon({
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterLogo(
      size: size,
    );
  }
}
