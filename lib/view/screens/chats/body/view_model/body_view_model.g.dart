// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BodyViewModel on _BodyViewModelBase, Store {
  final _$messageListAtom = Atom(name: '_BodyViewModelBase.messageList');

  @override
  List<Message> get messageList {
    _$messageListAtom.reportRead();
    return super.messageList;
  }

  @override
  set messageList(List<Message> value) {
    _$messageListAtom.reportWrite(value, super.messageList, () {
      super.messageList = value;
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
messageList: ${messageList},
selectedButtonIndex: ${selectedButtonIndex}
    ''';
  }
}
