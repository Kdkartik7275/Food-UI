import 'package:flutter/material.dart';

class TNavigators {
  static void navigateReplacement(BuildContext context, Widget navigateTo) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => navigateTo));
  }

  static void navigatePush(BuildContext context, Widget navigateTo) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => navigateTo));
  }
}
