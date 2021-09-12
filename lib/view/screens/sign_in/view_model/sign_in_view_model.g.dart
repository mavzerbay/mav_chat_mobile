// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInViewModel on _SignInViewModelBase, Store {
  final _$hidePasswordAtom = Atom(name: '_SignInViewModelBase.hidePassword');

  @override
  bool get hidePassword {
    _$hidePasswordAtom.reportRead();
    return super.hidePassword;
  }

  @override
  set hidePassword(bool value) {
    _$hidePasswordAtom.reportWrite(value, super.hidePassword, () {
      super.hidePassword = value;
    });
  }

  final _$emailErrorTextAtom =
      Atom(name: '_SignInViewModelBase.emailErrorText');

  @override
  String? get emailErrorText {
    _$emailErrorTextAtom.reportRead();
    return super.emailErrorText;
  }

  @override
  set emailErrorText(String? value) {
    _$emailErrorTextAtom.reportWrite(value, super.emailErrorText, () {
      super.emailErrorText = value;
    });
  }

  final _$passwordErrorTextAtom =
      Atom(name: '_SignInViewModelBase.passwordErrorText');

  @override
  String? get passwordErrorText {
    _$passwordErrorTextAtom.reportRead();
    return super.passwordErrorText;
  }

  @override
  set passwordErrorText(String? value) {
    _$passwordErrorTextAtom.reportWrite(value, super.passwordErrorText, () {
      super.passwordErrorText = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_SignInViewModelBase.login');

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_SignInViewModelBaseActionController =
      ActionController(name: '_SignInViewModelBase');

  @override
  dynamic changeHidePasswordStatus() {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
        name: '_SignInViewModelBase.changeHidePasswordStatus');
    try {
      return super.changeHidePasswordStatus();
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic emailValidation(String? value) {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
        name: '_SignInViewModelBase.emailValidation');
    try {
      return super.emailValidation(value);
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic passwordValidation(String? value) {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
        name: '_SignInViewModelBase.passwordValidation');
    try {
      return super.passwordValidation(value);
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hidePassword: ${hidePassword},
emailErrorText: ${emailErrorText},
passwordErrorText: ${passwordErrorText}
    ''';
  }
}
