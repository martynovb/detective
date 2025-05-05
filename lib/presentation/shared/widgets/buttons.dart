import 'package:flutter/material.dart';

class Buttons {
  static Widget simpleButton({
    Key? key,
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      key: key,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
