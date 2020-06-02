import 'package:flutter/material.dart';

Future push(context, page, {replace = false}) {
  if (replace == true) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
