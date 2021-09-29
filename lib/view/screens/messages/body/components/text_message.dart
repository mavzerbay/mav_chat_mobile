import 'package:flutter/material.dart';
import 'package:mav_chat/view/_product/models/message.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/extensions/context_extension.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
    required this.isSender,
  }) : super(key: key);

  final Message message;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ApplicationConstants.kDefaultPadding * 0.75,
        vertical: ApplicationConstants.kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: ApplicationConstants.kPrimaryColor.withOpacity(isSender ? 1 : 0.1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topRight: isSender ? Radius.circular(0) : Radius.circular(10),
          topLeft: isSender ? Radius.circular(10) : Radius.circular(0),
        ),
      ),
      child: Text(
        message.messageText!,
        style: TextStyle(
          color: isSender ? Colors.white : context.textTheme.bodyText1!.color,
        ),
      ),
    );
  }
}
