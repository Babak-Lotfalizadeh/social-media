import 'package:flutter/material.dart';

class FieldValueWidget extends StatelessWidget {
  final String? title;
  final String value;

  const FieldValueWidget({
    required this.value,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(value),
        Text(title ?? ''),
      ],
    );
  }
}
