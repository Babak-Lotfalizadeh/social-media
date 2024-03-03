import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {

  void pushReplace(Widget nextPage){
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (context) => nextPage,
      ),
    );
  }

  void push(Widget nextPage) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => nextPage,)
    );
  }

  void pop([bool result = false]){
    Navigator.of(this).pop(result);
  }

}