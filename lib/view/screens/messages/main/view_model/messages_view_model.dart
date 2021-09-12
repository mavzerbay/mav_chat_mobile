import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/abstracts/base_view_model.dart';

part 'messages_view_model.g.dart';

class MessagesViewModel = _MessagesViewModelBase with _$MessagesViewModel;

abstract class _MessagesViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
}
