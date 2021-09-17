import 'package:flutter/material.dart';

import 'custom_dialogs/custom_dialog_box.dart';
import 'custom_dialogs/custom_loader_dialog.dart';

class MavDialog {
  static bool dialogIsOpen = false;

  static showLoaderDialog(
    BuildContext _context, {
    bool barrierDismissible = false,
    String? text,
  }) {
    if (dialogIsOpen) {
      Navigator.of(_context).pop();
      dialogIsOpen = true;
    }
    showDialog(
      context: _context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return CustomLoaderDialog(
          text: text,
        );
      },
    );
  }

  static showCustomDialogBox(
    BuildContext _context, {
    required String title,
    required String acceptButtonText,
    String? descriptions,
    String? rejectButtonText,
    Image? image,
    IconData? icon,
    Color? iconColor,
    VoidCallback? acceptButtonFunc,
    VoidCallback? rejectButtonFunc,
    bool isDismissible = true,
  }) {
    if (dialogIsOpen) {
      Navigator.of(_context).pop();
      dialogIsOpen = true;
    }
    showDialog(
      barrierDismissible: isDismissible,
      context: _context,
      builder: (context) {
        return CustomDialogBox(
          title: title,
          acceptButtonText: acceptButtonText,
          acceptButtonFunc: acceptButtonFunc,
          rejectButtonText: rejectButtonText,
          rejectButtonFunc: rejectButtonFunc,
          descriptions: descriptions,
          image: image,
          icon: icon,
          iconColor: iconColor,
        );
      },
    );
  }
}
