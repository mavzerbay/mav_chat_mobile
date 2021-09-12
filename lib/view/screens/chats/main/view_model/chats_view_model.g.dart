// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatsViewModel on _ChatsViewModelBase, Store {
  final _$selectedIndexAtom = Atom(name: '_ChatsViewModelBase.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$_ChatsViewModelBaseActionController =
      ActionController(name: '_ChatsViewModelBase');

  @override
  dynamic changeIndex(int index) {
    final _$actionInfo = _$_ChatsViewModelBaseActionController.startAction(
        name: '_ChatsViewModelBase.changeIndex');
    try {
      return super.changeIndex(index);
    } finally {
      _$_ChatsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex}
    ''';
  }
}
