// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BodyViewModel on _BodyViewModelBase, Store {
  final _$showSendButtonAtom = Atom(name: '_BodyViewModelBase.showSendButton');

  @override
  bool get showSendButton {
    _$showSendButtonAtom.reportRead();
    return super.showSendButton;
  }

  @override
  set showSendButton(bool value) {
    _$showSendButtonAtom.reportWrite(value, super.showSendButton, () {
      super.showSendButton = value;
    });
  }

  final _$_BodyViewModelBaseActionController =
      ActionController(name: '_BodyViewModelBase');

  @override
  dynamic hideOrShowSendButton() {
    final _$actionInfo = _$_BodyViewModelBaseActionController.startAction(
        name: '_BodyViewModelBase.hideOrShowSendButton');
    try {
      return super.hideOrShowSendButton();
    } finally {
      _$_BodyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sendMessage() {
    final _$actionInfo = _$_BodyViewModelBaseActionController.startAction(
        name: '_BodyViewModelBase.sendMessage');
    try {
      return super.sendMessage();
    } finally {
      _$_BodyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showSendButton: ${showSendButton}
    ''';
  }
}
