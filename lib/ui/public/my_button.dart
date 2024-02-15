import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';

class MyButton extends StatelessWidget {
  final Widget? child;
  final String? title;
  final Function() onPressed;

  const MyButton({
    required this.onPressed,
    this.title,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(StaticSize.radiusNormal),
        ),
      ),
      child: child ??
          Text(
            title ?? '',
          ),
    );
  }
}
