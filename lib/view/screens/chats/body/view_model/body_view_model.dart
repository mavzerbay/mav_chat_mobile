import 'package:flutter/material.dart';
import 'package:mav_chat/core/base/model/concrete/base_error.dart';
import 'package:mav_chat/core/components/dialog/mav_dialog.dart';
import 'package:mav_chat/core/constants/enums/http_request_enum.dart';
import 'package:mav_chat/core/constants/enums/locale_preferences_keys_enum.dart';
import 'package:mav_chat/core/extensions/string_extension.dart';
import 'package:mav_chat/core/init/lang/locale_keys.g.dart';
import 'package:mav_chat/core/init/network/network_route_enum.dart';
import 'package:mav_chat/view/_product/models/message.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/abstracts/base_view_model.dart';
import '../../../../../core/init/network/network_manager.dart';

part 'body_view_model.g.dart';

class BodyViewModel = _BodyViewModelBase with _$BodyViewModel;

abstract class _BodyViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) async {
    this.context = context;
    networkManager = NetworkManager()
        .addLoadersOnRequest()
        .addBuildContext(context)
        .addNavigationService(navigation)
        .build();
    getMessages();
  }

  @override
  void init() {
    print(localeManager.getStringValue(LocalePreferencesKeys.TOKEN));
  }

  @observable
  List<Message> messageList = [];

  getMessages() async {
    try {
      final response = await networkManager!.send<List<Message>, Message>(
        NetworkRoutes.MESSAGES.rawValue,
        parseModel: Message(),
        type: HttpTypes.GET,
        queryParameters: {},
      );
      if (response.error != null) {
        if ((response.error as BaseError).closeLoader != null &&
            (response.error as BaseError).closeLoader!)
          Navigator.of(context!, rootNavigator: true).pop();

        MavDialog.showCustomDialogBox(
          context!,
          title: (response.error! as BaseError).error,
          descriptions: (response.error! as BaseError).description,
          acceptButtonText: LocaleKeys.common_okey.locale,
        );
      } else if (response.data != null) {
        messageList.addAll(response.data!);
      }
    } catch (e) {
      print(e);
    }
  }

  @observable
  int selectedButtonIndex = 0;

  @action
  changeSelectedButtonIndex(int index) {
    selectedButtonIndex = index;
  }
}
