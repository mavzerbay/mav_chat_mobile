import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mav_chat/core/extensions/string_extension.dart';
import 'package:mav_chat/core/init/lang/locale_keys.g.dart';

import '../../../components/dialog/mav_dialog.dart';
import '../../../constants/enums/locale_preferences_keys_enum.dart';
import '../../../constants/navigation/navigation_constants.dart';
import '../../../init/cache/locale_manager.dart';
import '../../../init/navigation/navigation_service.dart';
import '../../../init/network/core_dio_interface.dart';
import '../../../utils/jwt_utils.dart';

abstract class BaseViewModel {
  BuildContext? context;

  ICoreDio? networkManager;

  // VexanaManager? vexanaManager;

  // VexanaManager get vexanaManagerComputed => VexanaManager.instance(context);

  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;

  void setContext(BuildContext context);

  void init();

  Future<void> showLoaderDialog({String? text}) async {
    MavDialog.showLoaderDialog(context!, text: text);
  }

  hideLoaderDialog() {
    Navigator.of(context!, rootNavigator: true).pop();
  }

  //Get the access token of the logged in user
  Future<String> getAuthBearerToken() async {
    final token = LocaleManager.instance.getStringValue(LocalePreferencesKeys.TOKEN);
    if (token.isNotEmpty && !JwtUtils.isExpired(token)) {
      LocaleManager.instance.removeValue(LocalePreferencesKeys.TOKEN);
      MavDialog.showCustomDialogBox(context!,
          title: LocaleKeys.authorization_expirationEnd.locale,
          acceptButtonText: LocaleKeys.common_okey.locale,
          acceptButtonFunc: () async =>
             await navigation.navigateToPageClear(path: NavigationConstants.SIGN_IN));
    }
    return token.isNotEmpty ? token : "";
  }

  Future<Map<String, String>?> getHeaders() async {
    var token = await getAuthBearerToken();
    return {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
  }
}
