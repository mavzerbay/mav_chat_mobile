// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpViewModel on _SignUpViewModelBase, Store {
  final _$hidePasswordAtom = Atom(name: '_SignUpViewModelBase.hidePassword');

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

  final _$isValidFormAtom = Atom(name: '_SignUpViewModelBase.isValidForm');

  @override
  bool get isValidForm {
    _$isValidFormAtom.reportRead();
    return super.isValidForm;
  }

  @override
  set isValidForm(bool value) {
    _$isValidFormAtom.reportWrite(value, super.isValidForm, () {
      super.isValidForm = value;
    });
  }

  final _$passwordErrorTextAtom =
      Atom(name: '_SignUpViewModelBase.passwordErrorText');

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

  final _$passwordConfirmErrorTextAtom =
      Atom(name: '_SignUpViewModelBase.passwordConfirmErrorText');

  @override
  String? get passwordConfirmErrorText {
    _$passwordConfirmErrorTextAtom.reportRead();
    return super.passwordConfirmErrorText;
  }

  @override
  set passwordConfirmErrorText(String? value) {
    _$passwordConfirmErrorTextAtom
        .reportWrite(value, super.passwordConfirmErrorText, () {
      super.passwordConfirmErrorText = value;
    });
  }

  final _$nameErrorTextAtom = Atom(name: '_SignUpViewModelBase.nameErrorText');

  @override
  String? get nameErrorText {
    _$nameErrorTextAtom.reportRead();
    return super.nameErrorText;
  }

  @override
  set nameErrorText(String? value) {
    _$nameErrorTextAtom.reportWrite(value, super.nameErrorText, () {
      super.nameErrorText = value;
    });
  }

  final _$surnameErrorTextAtom =
      Atom(name: '_SignUpViewModelBase.surnameErrorText');

  @override
  String? get surnameErrorText {
    _$surnameErrorTextAtom.reportRead();
    return super.surnameErrorText;
  }

  @override
  set surnameErrorText(String? value) {
    _$surnameErrorTextAtom.reportWrite(value, super.surnameErrorText, () {
      super.surnameErrorText = value;
    });
  }

  final _$emailErrorTextAtom =
      Atom(name: '_SignUpViewModelBase.emailErrorText');

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

  final _$registerAsyncAction = AsyncAction('_SignUpViewModelBase.register');

  @override
  Future register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$_SignUpViewModelBaseActionController =
      ActionController(name: '_SignUpViewModelBase');

  @override
  dynamic changeHidePasswordStatus() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.changeHidePasswordStatus');
    try {
      return super.changeHidePasswordStatus();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool formIsValid() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.formIsValid');
    try {
      return super.formIsValid();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic emailValidation(String? value) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.emailValidation');
    try {
      return super.emailValidation(value);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic passwordValidation(String? value) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.passwordValidation');
    try {
      return super.passwordValidation(value);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic passwordConfirmValidation(String? value) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.passwordConfirmValidation');
    try {
      return super.passwordConfirmValidation(value);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic nameValidation(String? value) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.nameValidation');
    try {
      return super.nameValidation(value);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic surnameValidation(String? value) {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.surnameValidation');
    try {
      return super.surnameValidation(value);
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hidePassword: ${hidePassword},
isValidForm: ${isValidForm},
passwordErrorText: ${passwordErrorText},
passwordConfirmErrorText: ${passwordConfirmErrorText},
nameErrorText: ${nameErrorText},
surnameErrorText: ${surnameErrorText},
emailErrorText: ${emailErrorText}
    ''';
  }
}
