// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BodyViewModel on _BodyViewModelBase, Store {
  final _$userListAtom = Atom(name: '_BodyViewModelBase.userList');

  @override
  List<UserDto> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<UserDto> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  final _$selectedButtonIndexAtom =
      Atom(name: '_BodyViewModelBase.selectedButtonIndex');

  @override
  int get selectedButtonIndex {
    _$selectedButtonIndexAtom.reportRead();
    return super.selectedButtonIndex;
  }

  @override
  set selectedButtonIndex(int value) {
    _$selectedButtonIndexAtom.reportWrite(value, super.selectedButtonIndex, () {
      super.selectedButtonIndex = value;
    });
  }

  final _$_BodyViewModelBaseActionController =
      ActionController(name: '_BodyViewModelBase');

  @override
  dynamic changeSelectedButtonIndex(int index) {
    final _$actionInfo = _$_BodyViewModelBaseActionController.startAction(
        name: '_BodyViewModelBase.changeSelectedButtonIndex');
    try {
      return super.changeSelectedButtonIndex(index);
    } finally {
      _$_BodyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userList: ${userList},
selectedButtonIndex: ${selectedButtonIndex}
    ''';
  }
}
