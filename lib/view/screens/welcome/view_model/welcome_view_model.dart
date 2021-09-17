import 'package:flutter/material.dart';
import 'package:mav_chat/core/constants/enums/locale_preferences_keys_enum.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/abstracts/base_view_model.dart';

part 'welcome_view_model.g.dart';

class WelcomeViewModel = _WelcomeViewModelBase with _$WelcomeViewModel;

abstract class _WelcomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    if (!localeManager.getBoolValue(LocalePreferencesKeys.IS_FIRST_APP)) {
      localeManager.setBoolValue(LocalePreferencesKeys.IS_FIRST_APP, true);
    }
  }
}
