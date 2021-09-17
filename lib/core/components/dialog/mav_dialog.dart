import 'package:flutter/material.dart';

import 'custom_dialogs/custom_dialog_box.dart';
import 'custom_dialogs/custom_loader_dialog.dart';

class MavDialog {
  static showLoaderDialog(
    BuildContext context, {
    bool barrierDismissible = false,
    String? text,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return CustomLoaderDialog(
          text: text,
        );
      },
    );
  }

  static showCustomDialogBox(
    BuildContext context, {
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
    showDialog(
      barrierDismissible: isDismissible,
      context: context,
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
