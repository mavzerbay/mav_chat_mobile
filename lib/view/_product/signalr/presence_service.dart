import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../core/constants/app/app_constants.dart';

class PresenceService {
  static PresenceService? _instance;
  static HubConnection? _hubConnection;
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
  BehaviorSubject<List<String>> onlineUsersSource = BehaviorSubject<List<String>>();
  Stream<List<String>> get onlineUsers$ => onlineUsersSource.stream;

  createHubConnection(String token) {
    _hubConnection = HubConnectionBuilder()
        .withUrl(
            "$baseUrl/hubs/presence",
            HttpConnectionOptions(
              accessTokenFactory: () => Future.value(token),
            ))
        .withAutomaticReconnect()
        .build();

    _hubConnection!.start()!.catchError((error) => print(error));

    _hubConnection!.on("UserIsOnline", (userName) {
      if (!this.onlineUsersSource.hasValue) {
        this.onlineUsersSource.add([userName] as List<String>);
      }
      this.onlineUsers$.listen((userNames) {
        userNames.add(userName as String);
        this.onlineUsersSource.add(userNames);
      });
    });

    _hubConnection!.on("UserIsOffline", (userName) {
      this.onlineUsers$.listen((userNames) {
        this.onlineUsersSource.add(userNames.where((x) => x != (userName as String)).toList());
      });
    });

    _hubConnection!.on("GetOnlineUsers", (userNames) {
      print(userNames);
      this.onlineUsersSource.add(userNames as List<String>);
    });

    _hubConnection!.on(
        "NewMessageReceived",
        ([userName, nameSurname]) => {
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
              )),
            });
  }

  stopHubConnection() {
    if (_hubConnection != null) {
      _hubConnection!.stop();
    }
  }
}
