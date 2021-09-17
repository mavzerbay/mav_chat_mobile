import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../core/constants/app/app_constants.dart';
import '../../../core/init/network/network_route_enum.dart';
import '../../../view/_product/models/user_dto.dart';
import '../models/group.dart';
import '../models/message.dart';
import '../models/paginated_result.dart';
import '../models/pagination.dart';

class MessageService {
  static MessageService? _instance;
  static HubConnection? hubConnection;
  static BuildContext? context;

  static MessageService? instance(BuildContext? _context) {
    context = _context;
    _instance ??= MessageService._init();
    return _instance;
  }

  final baseUrl =
      Platform.isAndroid ? ApplicationConstants.androidBaseUrl : ApplicationConstants.iosBaseUrl;

  MessageService._init();

  BehaviorSubject<List<Message>> messageThreadSource = BehaviorSubject<List<Message>>();
  Stream<List<Message>> get messageThread$ => messageThreadSource.stream;

  createHubConnection(UserDto user, String otherUserName) {
    hubConnection = HubConnectionBuilder()
        .withUrl(
            "$baseUrl/hubs/message?user=$otherUserName",
            HttpConnectionOptions(
              accessTokenFactory: () => Future.value(user.token),
            ))
        .withAutomaticReconnect()
        .build();

    hubConnection!.start()!.catchError((error) => print(error));

    hubConnection!.on("ReceiveMessageThread", (messages) {
      messageThreadSource.add(messages as List<Message>);
    });

    hubConnection!.on(
        "NewMessage",
        (message) => {
              this.messageThread$.listen((messages) {
                messages.add(message as Message);
                this.messageThreadSource.add(messages);
              })
            });

    hubConnection!.on(
        "UpdatedGroup",
        (group) => {
              if ((group as Group).connections!.any((x) => x.userName == otherUserName))
                {
                  this.messageThread$.listen((messages) => {
                        messages.forEach((message) => {
                              if (message.readDate == null) {message.readDate = DateTime.now()}
                            }),
                        this.messageThreadSource.add(messages)
                      })
                }
            });
  }

  stopHubConnection() {
    if (hubConnection != null) {
      hubConnection!.stop();
    }
  }

  getMessages(pageNumber, pageSize, container) async {
    Map<String, String> params = getPaginationHeaders(pageNumber, pageSize);
    params["Container"] = container;
    final response =
        await http.get(Uri(path: baseUrl + NetworkRoutes.MESSAGES.rawValue), headers: params);

    if (response.statusCode == 200) {
      final paginatedResult = PaginatedResult();
      paginatedResult.result = response.body;

      if (response.headers.containsKey("Pagination")) {
        paginatedResult.pagination =
            Pagination.fromJson(json.decode(json.encode(response.headers["Pagination"])));
      }

      return paginatedResult;
    }
    return null;
  }

  getMessageThread(String userName) async {
    return (await http.get(Uri(path: "$baseUrl/messages/thread/$userName"))).body as List<Message>;
  }

  sendMessage(String receiverUserName, String content) {
    return hubConnection!.invoke("SendMessage",
        args: [receiverUserName, content]).catchError((error) => print(error));
  }

  deleteMessage(id) {
    return http.delete(Uri(path: "$baseUrl/Messages/$id"));
  }
}
