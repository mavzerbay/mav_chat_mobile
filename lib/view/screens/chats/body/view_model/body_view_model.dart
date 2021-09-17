import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/abstracts/base_view_model.dart';
import '../../../../../core/constants/enums/locale_preferences_keys_enum.dart';
import '../../../../../core/init/network/network_manager.dart';
import '../../../../_product/signalr/presence_service.dart';

part 'body_view_model.g.dart';

class BodyViewModel = _BodyViewModelBase with _$BodyViewModel;

abstract class _BodyViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) async {
    this.context = context;
    networkManager = NetworkManager()
        .addLoadersOnRequest(true)
        .addTimeout(1000)
        .addBuildContext(context)
        .build();
  }

  @override
  void init() {}

  @observable
  int selectedButtonIndex = 0;

  @action
  changeSelectedButtonIndex(int index) {
    selectedButtonIndex = index;
  }
}
