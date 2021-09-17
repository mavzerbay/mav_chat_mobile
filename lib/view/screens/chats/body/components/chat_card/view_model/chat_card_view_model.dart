import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../core/base/model/abstracts/base_view_model.dart';
import '../../../../../../../core/constants/enums/locale_preferences_keys_enum.dart';
import '../../../../../../_product/signalr/presence_service.dart';

part 'chat_card_view_model.g.dart';

class ChatCardViewModel = _ChatCardViewModelBase with _$ChatCardViewModel;

abstract class _ChatCardViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  PresenceService? presenceService;

  String? userName;

  @override
  void init() {
    presenceService = PresenceService.instance(context);
    presenceService!.createHubConnection(localeManager.getStringValue(LocalePreferencesKeys.TOKEN));
  }
}
