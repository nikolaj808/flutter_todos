import 'package:flutter/material.dart';

enum SnackBarType {
  info,
  success,
  error;

  Color get color {
    switch (this) {
      case SnackBarType.info:
        return Colors.blueGrey;
      case SnackBarType.success:
        return Colors.green;
      case SnackBarType.error:
        return Colors.red;
    }
  }
}

class SnackBarHelper {
  const SnackBarHelper();

  static showSnackBar({
    Key? key,
    required BuildContext context,
    required String message,
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    SnackBarType snackBarType = SnackBarType.info,
    bool hideCurrentSnackBar = true,
  }) {
    if (hideCurrentSnackBar) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        key: key,
        content: Text(message),
        behavior: behavior,
        backgroundColor: snackBarType.color,
      ),
    );
  }
}
