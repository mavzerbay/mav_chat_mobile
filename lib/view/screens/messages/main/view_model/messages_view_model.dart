import 'package:flutter/material.dart';
import 'package:mav_chat/core/base/model/concrete/base_error.dart';
import 'package:mav_chat/core/components/dialog/mav_dialog.dart';
import 'package:mav_chat/core/constants/enums/http_request_enum.dart';
import 'package:mav_chat/core/constants/enums/locale_preferences_keys_enum.dart';
import 'package:mav_chat/core/extensions/string_extension.dart';
import 'package:mav_chat/core/init/lang/locale_keys.g.dart';
import 'package:mav_chat/core/init/network/network_manager.dart';
import 'package:mav_chat/core/init/network/network_route_enum.dart';
import 'package:mav_chat/view/_product/models/user_dto.dart';
import 'package:mav_chat/view/_product/signalr/presence_service.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/abstracts/base_view_model.dart';

part 'messages_view_model.g.dart';

class MessagesViewModel = _MessagesViewModelBase with _$MessagesViewModel;

abstract class _MessagesViewModelBase with Store, BaseViewModel {
  PresenceService? presenceService;

  @override
  void setContext(BuildContext context) {
    this.context = context;
    networkManager = NetworkManager()
        .addLoadersOnRequest()
        .addBuildContext(context)
        .addNavigationService(navigation)
        .build();
    if (localeManager.getStringValue(LocalePreferencesKeys.TOKEN) != "") {
      presenceService = PresenceService.instance(context);
      presenceService!
          .createHubConnection(localeManager.getStringValue(LocalePreferencesKeys.TOKEN));
    }
  }

  @override
  void init() {}

  Future<UserDto> getUser(String userName) async {
    try {
      final response = await networkManager!.send<UserDto, UserDto>(
        "${NetworkRoutes.USERS.rawValue}/$userName",
        parseModel: UserDto(),
        type: HttpTypes.GET,
      );
      if (response.error != null) {
        if ((response.error as BaseError).closeLoader != null &&
            (response.error as BaseError).closeLoader!) navigation.closeDialog();

        MavDialog.showCustomDialogBox(context!,
            title: (response.error! as BaseError).error,
            descriptions: (response.error! as BaseError).description,
            acceptButtonText: LocaleKeys.common_okey.locale, acceptButtonFunc: () {
          if ((response.error! as BaseError).navigationConstants != null) {
            navigation.navigateToPageClear(
                path: (response.error! as BaseError).navigationConstants!);
          } else {
            navigation.closeDialog();
          }
        });
      } else if (response.data != null) {
        return response.data!;
      }
      return Future.value(null);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }
}
