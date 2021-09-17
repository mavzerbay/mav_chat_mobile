import 'package:flutter/material.dart';
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

  @override
  void init() {
    if (localeManager.getStringValue(LocalePreferencesKeys.TOKEN) != "") {      
      presenceService = PresenceService.instance(context);
      presenceService!
          .createHubConnection(LocaleManager.instance.getStringValue(LocalePreferencesKeys.TOKEN));
    }
  }

  @observable
  int selectedIndex = 0;

  @action
  changeIndex(int index) {
    selectedIndex = index;
  }
}
