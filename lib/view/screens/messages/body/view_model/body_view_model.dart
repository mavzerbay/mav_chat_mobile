import 'package:flutter/material.dart';
import 'package:mav_chat/core/components/dialog/mav_dialog.dart';
import 'package:mav_chat/core/constants/enums/locale_preferences_keys_enum.dart';
import 'package:mav_chat/core/constants/navigation/navigation_constants.dart';
import 'package:mav_chat/core/extensions/string_extension.dart';
import 'package:mav_chat/core/init/lang/locale_keys.g.dart';
import 'package:mav_chat/core/init/network/network_manager.dart';
import 'package:mav_chat/core/utils/jwt_utils.dart';
import 'package:mav_chat/view/_product/signalr/message_service.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/abstracts/base_view_model.dart';

part 'body_view_model.g.dart';

class BodyViewModel = _BodyViewModelBase with _$BodyViewModel;

abstract class _BodyViewModelBase with Store, BaseViewModel {
  String receiverUserName = "";
  String currentUserName = "";

  MessageService? messageService;

  @override
  void setContext(BuildContext context) {
    this.context = context;
    networkManager = NetworkManager()
        .addLoadersOnRequest()
        .addBuildContext(context)
        .addNavigationService(navigation)
        .build();
    if (localeManager.getStringValue(LocalePreferencesKeys.TOKEN) != "") {
      messageService = MessageService.instance(context);
      messageService!.createHubConnection(
          localeManager.getStringValue(LocalePreferencesKeys.TOKEN), receiverUserName);
      currentUserName = JwtUtils.parseJwt(
          localeManager.getStringValue(LocalePreferencesKeys.TOKEN))['unique_name'];
    } else {
      MavDialog.showCustomDialogBox(
        context,
        title: LocaleKeys.authorization_expirationEnd.locale,
        acceptButtonText: LocaleKeys.common_okey.locale,
        acceptButtonFunc: () {
          navigation.navigateToPageClear(path: NavigationConstants.SIGN_IN);
        },
        icon: Icons.timer_off_rounded,
        iconColor: Colors.red,
      );
    }
  }

  @override
  void init() {}

  void dispose() {
    //messageService!.stopHubConnection();
  }

  TextEditingController chatTEC = new TextEditingController();

  @observable
  bool showSendButton = false;

  @action
  hideOrShowSendButton() {
    if (chatTEC.text.isNotEmpty) {
      showSendButton = true;
    } else {
      showSendButton = false;
    }
  }

  @action
  sendMessage() {
    print("girdi");
    messageService!.sendMessage(receiverUserName, chatTEC.text);
    chatTEC.clear();
    FocusScope.of(context!).requestFocus(FocusNode());
  }
}
