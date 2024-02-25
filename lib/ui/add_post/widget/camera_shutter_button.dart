import 'package:flutter/material.dart';

class CameraShutterButton extends StatelessWidget {
  final Function() onClick;

  const CameraShutterButton({
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).cardColor;
    final size = MediaQuery.of(context).size.height * 0.1;
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: size,
        width: size,
        padding: EdgeInsets.all(size * 0.05),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: color,
            width: size * 0.05,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
