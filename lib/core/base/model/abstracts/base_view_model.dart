import 'package:flutter/material.dart';

import '../../../components/dialog/custom_dialog_box.dart';
import '../../../components/dialog/custom_loader_dialog.dart';
import '../../../init/cache/locale_manager.dart';
import '../../../init/navigation/navigation_service.dart';
import '../../../init/network/core_dio_interface.dart';
import '../../../init/network/network_manager.dart';
import '../../../init/network/vexana_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;

  ICoreDio? coreDio = NetworkManager.instance!.coreDio;
  VexanaManager? vexanaManager;

  VexanaManager get vexanaManagerComputed => VexanaManager.instance(context);

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context) {
    vexanaManager = VexanaManager.instance(context);
  }

  void init();

  void showCustomDialog({
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
      context: context!,
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

  Future<void> showLoaderDialog({String? text}) async {
    showDialog(
      context: context!,
      barrierDismissible: false,
      builder: (context) {
        return CustomLoaderDialog(
          text: text,
        );
      },
    );
  }

  hideLoaderDialog() {
    Navigator.of(context!, rootNavigator: true).pop();
  }
}
