import 'package:flutter/material.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../chats/body/models/ChatMessage.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ApplicationConstants.kDefaultPadding * 0.75,
        vertical: ApplicationConstants.kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: ApplicationConstants.kPrimaryColor.withOpacity(message.isSender ? 1 : 0.1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topRight: message.isSender ? Radius.circular(0) : Radius.circular(10),
          topLeft: message.isSender ? Radius.circular(10) : Radius.circular(0),
        ),
      ),
      child: Text(
        message.text!,
        style: TextStyle(
          color: message.isSender ? Colors.white : context.textTheme.bodyText1!.color,
        ),
      ),
    );
  }
}
