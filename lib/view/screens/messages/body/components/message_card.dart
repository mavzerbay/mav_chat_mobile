import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mav_chat/view/_product/models/message.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import 'text_message.dart';
import 'video_message.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    Key? key,
    required this.message,
    required this.isSender,
  }) : super(key: key);

  final Message message;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(Message message) {
      if (message.file != null) {
        return VideoMessage(message: message);
      } else {
        return TextMessage(message: message, isSender: isSender);
      }
      // switch (message) {
      //   case ChatMessageType.text:
      //     return TextMessage(message: message);
      //   case ChatMessageType.audio:
      //     return AudiMessage(message: message);
      //   case ChatMessageType.video:
      //     return VideoMessage(message: message);
      //   default:
      //     return SizedBox();
      // }
    }

    return Padding(
      padding: const EdgeInsets.only(top: ApplicationConstants.kDefaultPadding),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: MemoryImage(Base64Decoder().convert(message.sender!.profilePhoto!)),
            ),
            SizedBox(width: ApplicationConstants.kDefaultPadding / 2),
          ],
          messageContaint(message),
          if (isSender) MessageStatusDot(readDate: message.readDate)
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  const MessageStatusDot({Key? key, this.readDate}) : super(key: key);

  final DateTime? readDate;
  @override
  Widget build(BuildContext context) {
    Color dotColor(DateTime? readDate) {
      if (readDate == null) {
        return context.textTheme.bodyText1!.color!.withOpacity(0.1);
      } else {
        return ApplicationConstants.kPrimaryColor;
      }
      // switch (readDate) {
      //   case MessageStatus.not_sent:
      //     return ApplicationConstants.kErrorColor;
      //   case MessageStatus.not_view:
      //     return context.textTheme.bodyText1!.color!.withOpacity(0.1);
      //   case MessageStatus.viewed:
      //     return ApplicationConstants.kPrimaryColor;
      //   default:
      //     return Colors.transparent;
      // }
    }

    return Container(
      margin: EdgeInsets.only(left: ApplicationConstants.kDefaultPadding / 2),
      height: context.size18,
      width: context.size18,
      decoration: BoxDecoration(
        color: dotColor(readDate),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.done, //status == MessageStatus.not_sent ? Icons.close :
        size: context.size12,
        color: context.theme.scaffoldBackgroundColor,
      ),
    );
  }
}
