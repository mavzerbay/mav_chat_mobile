import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../core/constants/app/app_constants.dart';

class PresenceService {
  static PresenceService? _instance;
  HubConnection? hubConnection;
  static BuildContext? _context;

  static PresenceService? instance(BuildContext? context) {
    _context = context;
    _instance ??= PresenceService._init();
    return _instance;
  }

  final baseUrl =
      Platform.isAndroid ? ApplicationConstants.androidBaseUrl : ApplicationConstants.iosBaseUrl;

  PresenceService._init();

  // ignore: close_sinks
  BehaviorSubject<List<String>> _onlineUsersSource = BehaviorSubject<List<String>>.seeded([]);
  Stream<List<String>> get onlineUsers => _onlineUsersSource.stream;

  createHubConnection(String token) {
    hubConnection = HubConnectionBuilder()
        .withUrl(
            "$baseUrl/hubs/presence",
            HttpConnectionOptions(
              accessTokenFactory: () => Future.value(token),
            ))
        .withAutomaticReconnect()
        .build();

    hubConnection!.start()!.catchError((error) => print(error));

    hubConnection!.on("UserIsOnline", (userName) {
      this._onlineUsersSource.add([userName![0] as String]);
    });

    hubConnection!.on("UserIsOffline", (userName) {
      _onlineUsersSource
          .add(_onlineUsersSource.value.where((x) => x != (userName![0] as String)).toList());
    });

    hubConnection!.on("GetOnlineUsers", (userNames) {
      List<String> userNameList = [];
      for (var i = 0; i < userNames![0].length; i++) {
        userNameList.add(userNames[0][i]);
      }
      this._onlineUsersSource.add(userNameList);
    });

    hubConnection!.on("NewMessageReceived", ([userName, nameSurname]) {
      print([userName, nameSurname]);
      ScaffoldMessenger.of(_context!).showSnackBar(SnackBar(
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
              Navigator.pushNamed(_context!, '/user', arguments: userName);
            }),
      ));
    });
  }

  stopHubConnection() {
    if (hubConnection != null) {
      hubConnection!.stop();
    }
  }
}
