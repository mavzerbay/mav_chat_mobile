import 'package:flutter/material.dart';
import 'package:mav_chat/core/base/model/concrete/base_error.dart';
import 'package:mav_chat/core/components/dialog/mav_dialog.dart';
import 'package:mav_chat/core/constants/enums/http_request_enum.dart';
import 'package:mav_chat/core/constants/enums/locale_preferences_keys_enum.dart';
import 'package:mav_chat/core/extensions/string_extension.dart';
import 'package:mav_chat/core/init/lang/locale_keys.g.dart';
import 'package:mav_chat/core/init/network/network_route_enum.dart';
import 'package:mav_chat/core/utils/jwt_utils.dart';
import 'package:mav_chat/view/_product/models/message.dart';
import 'package:mav_chat/view/_product/models/paginated_user_result.dart';
import 'package:mav_chat/view/_product/models/user_dto.dart';
import 'package:mav_chat/view/_product/signalr/presence_service.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/abstracts/base_view_model.dart';
import '../../../../../core/init/network/network_manager.dart';

part 'body_view_model.g.dart';

class BodyViewModel = _BodyViewModelBase with _$BodyViewModel;

abstract class _BodyViewModelBase with Store, BaseViewModel {
  PresenceService? presenceService;

  String currentUserName = "";
  @override
  void setContext(BuildContext context) async {
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
      currentUserName = JwtUtils.parseJwt(
          localeManager.getStringValue(LocalePreferencesKeys.TOKEN))['unique_name'];
    }
    //getMessages();
  }

  @override
  void init() {}

  @observable
  List<Message> messageList = [];
  List<UserDto> userList = [];

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

  Future<List<UserDto>> getUsers({bool onlineOnly = false}) async {
    try {
      final response = await networkManager!.send<PaginatedUserResult, PaginatedUserResult>(
        NetworkRoutes.USERS.rawValue,
        parseModel: PaginatedUserResult(),
        type: HttpTypes.GET,
        queryParameters: {
          "WithOutCurrent": true,
        },
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
        return Future.value(response.data!.data);
      }
      return Future.value(null);
    } catch (e) {
      print(e);
      return Future.value(null);
    }
  }

  @observable
  int selectedButtonIndex = 0;

  @action
  changeSelectedButtonIndex(int index) {
    selectedButtonIndex = index;
  }
}
