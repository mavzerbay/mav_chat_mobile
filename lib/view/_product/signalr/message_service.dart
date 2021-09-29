import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../core/constants/app/app_constants.dart';
import '../../../core/init/network/network_route_enum.dart';
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

  // ignore: close_sinks
  BehaviorSubject<List<Message>> _messageThreadSource = BehaviorSubject<List<Message>>.seeded([]);
  Stream<List<Message>> get messageThread => _messageThreadSource.stream;

  createHubConnection(String userToken, String otherUserName) {
    hubConnection = HubConnectionBuilder()
        .withUrl(
            "$baseUrl/hubs/message?user=$otherUserName",
            HttpConnectionOptions(
              accessTokenFactory: () => Future.value(userToken),
            ))
        .withAutomaticReconnect()
        .build();

    hubConnection!.start()!.catchError((error) => print(error));

    hubConnection!.on("ReceiveMessageThread", (messages) {
      List<Message> messageList = [];
      for (var i = 0; i < messages![0].length; i++) {
        messageList.add(Message().fromJson(messages[0][i]));
      }
      _messageThreadSource.add(messageList);
    });

    hubConnection!.on("NewMessage", (message) {
      Message tempMessage = Message().fromJson(message![0]);
      List<Message>? messageList = _messageThreadSource.valueOrNull;
      if (messageList == null) messageList = [];
      if (!messageList.any((element) => element.id == tempMessage.id)) messageList.add(tempMessage);
      _messageThreadSource.add(messageList);
    });

    hubConnection!.on(
        "UpdatedGroup",
        (group) => {
              if ((group as Group).connections!.any((x) => x.userName == otherUserName))
                {
                  this.messageThread.listen((messages) => {
                        messages.forEach((message) => {
                              if (message.readDate == null) {message.readDate = DateTime.now()}
                            }),
                        this._messageThreadSource.add(messages)
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

  sendMessage(String receiverUserName, String messageText) {
    return hubConnection!.invoke("SendMessage", args: [
      {"receiverUserName": receiverUserName, "messageText": messageText}
    ]).catchError((error) => print(error));
  }

  deleteMessage(id) {
    return http.delete(Uri(path: "$baseUrl/Messages/$id"));
  }
}
