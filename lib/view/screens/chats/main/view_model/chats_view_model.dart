import 'package:flutter/material.dart';
import 'package:mav_chat/core/constants/navigation/navigation_constants.dart';
import 'package:mav_chat/core/utils/jwt_utils.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/abstracts/base_view_model.dart';
import '../../../../../core/constants/enums/locale_preferences_keys_enum.dart';
import '../../../../../core/init/cache/locale_manager.dart';
import '../../../../_product/signalr/presence_service.dart';

part 'chats_view_model.g.dart';

class ChatsViewModel = _ChatsViewModelBase with _$ChatsViewModel;

abstract class _ChatsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  PresenceService? presenceService;

  String currentUserName = "";

  @override
  void init() {
    if (localeManager.getStringValue(LocalePreferencesKeys.TOKEN) != "") {
      presenceService = PresenceService.instance(context);
      presenceService!
          .createHubConnection(LocaleManager.instance.getStringValue(LocalePreferencesKeys.TOKEN));
      currentUserName = JwtUtils.parseJwt(
          localeManager.getStringValue(LocalePreferencesKeys.TOKEN))['unique_name'];
    }
  }

  @observable
  int selectedIndex = 0;

  @observable
  bool isOnline = false;

  @action
  changeIndex(int index) async {
    selectedIndex = index;
    if (index == 3) {
      await LocaleManager.instance.removeValue(LocalePreferencesKeys.TOKEN);
      presenceService!.stopHubConnection();
      await navigation.navigateToPageClear(path: NavigationConstants.SIGN_IN);
    }
  }

  @action
  currentUserIsOnline(List<String> userNameList) {
    isOnline = userNameList.any((x) => x == currentUserName);
  }
}
