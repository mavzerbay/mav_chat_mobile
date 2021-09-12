import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/abstracts/base_view_model.dart';

part 'body_view_model.g.dart';

class BodyViewModel = _BodyViewModelBase with _$BodyViewModel;

abstract class _BodyViewModelBase with Store,BaseViewModel {
    @override
    void setContext(BuildContext context) => this.context = context;
    @override
    void init() {}
}