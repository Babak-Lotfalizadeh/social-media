import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {

  void pushReplace(Widget nextPage){
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (context) => nextPage,
      ),
    );
  }

}