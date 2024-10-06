import 'package:flutter/material.dart';

class Moving {
  static navToPage({required BuildContext context, required Widget page}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}
