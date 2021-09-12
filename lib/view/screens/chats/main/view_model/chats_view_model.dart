import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/abstracts/base_view_model.dart';

part 'chats_view_model.g.dart';

class ChatsViewModel = _ChatsViewModelBase with _$ChatsViewModel;

abstract class _ChatsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  @observable
  int selectedIndex = 0;

  @action
  changeIndex(int index) {
    selectedIndex = index;
  }
}
