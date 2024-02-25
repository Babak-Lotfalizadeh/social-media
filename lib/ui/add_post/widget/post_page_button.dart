import 'package:flutter/material.dart';

class PostPageButton extends StatelessWidget {
  final Function() onPressed;
  final IconData iconData;

  const PostPageButton({
    required this.onPressed,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final buttonSize = MediaQuery.of(context).size.height * 0.05;

    return IconButton(
      onPressed: onPressed,
      icon: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.5),
        ),
        child: Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}
