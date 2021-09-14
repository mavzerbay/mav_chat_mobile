import 'dart:io';

import 'package:flutter/material.dart';

import '../../../components/dialog/custom_dialog_box.dart';
import '../../../components/dialog/custom_loader_dialog.dart';
import '../../../constants/enums/locale_preferences_keys_enum.dart';
import '../../../constants/navigation/navigation_constants.dart';
import '../../../init/cache/locale_manager.dart';
import '../../../init/navigation/navigation_service.dart';
import '../../../init/network/core_dio_interface.dart';
import '../../../init/network/network_manager.dart';
import '../../../init/network/vexana_manager.dart';
import '../../../utils/jwt_utils.dart';

abstract class BaseViewModel {
  BuildContext? context;

  ICoreDio? coreDio = NetworkManager.instance!.coreDio;
  VexanaManager? vexanaManager;

  VexanaManager get vexanaManagerComputed => VexanaManager.instance(context);

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context) async {
    vexanaManager = VexanaManager.instance(context);
    vexanaManager!.networkManager.addBaseHeader(
        MapEntry(HttpHeaders.authorizationHeader, "Bearer ${await getAuthBearerToken()}"));
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

  //Get the access token of the logged in user
  Future<String> getAuthBearerToken() async {
    final token = LocaleManager.instance.getStringValue(LocalePreferencesKeys.TOKEN);
    if (token.isNotEmpty && !JwtUtils().isExpired(token)) {
      LocaleManager.instance.removeValue(LocalePreferencesKeys.TOKEN);
      Navigator.pushNamed(context!, NavigationConstants.SIGN_IN);
    }
    return token.isNotEmpty ? token : "";
  }

  Future<Map<String, String>?> getHeaders() async {
    return {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${await getAuthBearerToken()}",
    };
  }
}
