import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mav_chat/core/constants/enums/http_request_enum.dart';
import 'package:mav_chat/core/init/network/network_route_enum.dart';
import 'package:mav_chat/core/init/network/vexana_manager.dart';
import 'package:mav_chat/view/_product/models/group.dart';
import 'package:mav_chat/view/_product/models/message.dart';
import 'package:mav_chat/view/_product/models/paginated_result.dart';
import 'package:mav_chat/view/_product/models/pagination.dart';
import 'package:vexana/vexana.dart';

import '../../../core/constants/app/app_constants.dart';

import 'package:signalr_core/signalr_core.dart';

import '../models/user_dto.dart';
import 'package:rxdart/subjects.dart';

import 'package:http/http.dart' as http;

class PresenceService {
  static PresenceService? _instance;
  static HubConnection? hubConnection;
  static BuildContext? context;
  static VexanaManager? vexanaManager;

  static PresenceService? instance(BuildContext? _context) {
    context = _context;
    vexanaManager = VexanaManager.instance(context);
    _instance ??= PresenceService._init();
    return _instance;
  }

  final baseUrl =
      Platform.isAndroid ? ApplicationConstants.androidBaseUrl : ApplicationConstants.iosBaseUrl;

  PresenceService._init();

  BehaviorSubject<List<String>> onlineUsersSource = BehaviorSubject<List<String>>();
  Stream<List<String>> get onlineUsers$ => onlineUsersSource.stream;

  createHubConnection(UserDto user, String otherUserName) {
    hubConnection = HubConnectionBuilder()
        .withUrl(
            "$baseUrl/hubs/presence",
            HttpConnectionOptions(
              accessTokenFactory: () => Future.value(user.token),
            ))
        .withAutomaticReconnect()
        .build();

    hubConnection!.start()!.catchError((error) => print(error));

    hubConnection!.on("UserIsOnline", (userName) {
      this.onlineUsers$.listen((userNames) {
        userNames.add(userName as String);
        this.onlineUsersSource.add(userNames);
      });
    });

    hubConnection!.on("UserIsOffline", (userName) {
      this.onlineUsers$.listen((userNames) {
        this.onlineUsersSource.add(userNames.where((x) => x != (userName as String)).toList());
      });
    });

    hubConnection!.on(
        "GetOnlineUsers", (userNames) => {this.onlineUsersSource.add(userNames as List<String>)});

    hubConnection!.on(
        "NewMessageReceived",
        ([userName, nameSurname]) => {
              ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
                content: Container(
                  color: ApplicationConstants.kPrimaryColor,
                  child: Center(
                    child: Text(
                      '$nameSurname Mesaj Gönderdi !',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                duration: const Duration(seconds: 5),
                action: SnackBarAction(
                    label: 'Cevap Yaz',
                    onPressed: () {
                      Navigator.pushNamed(context!, '/user', arguments: userName);
                    }),
              )),
            });
  }

  stopHubConnection() {
    if (hubConnection != null) {
      hubConnection!.stop();
    }
  }
}
