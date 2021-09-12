import 'package:flutter/material.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../chats/body/models/ChatMessage.dart';

class AudiMessage extends StatelessWidget {
  const AudiMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.55,
      height: context.size50,
      padding: EdgeInsets.symmetric(
        horizontal: ApplicationConstants.kDefaultPadding * 0.75,
        vertical: ApplicationConstants.kDefaultPadding / 2.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topRight: message.isSender ? Radius.circular(0) : Radius.circular(10),
          topLeft: message.isSender ? Radius.circular(10) : Radius.circular(0),
        ),
        color: ApplicationConstants.kPrimaryColor.withOpacity(message.isSender ? 1 : 0.1),
      ),
      child: Row(
        children: [
          Icon(
            Icons.play_arrow,
            color: message.isSender ? Colors.white : ApplicationConstants.kPrimaryColor,
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: ApplicationConstants.kDefaultPadding / 2),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: message.isSender
                        ? Colors.white
                        : ApplicationConstants.kPrimaryColor.withOpacity(0.4),
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      height: context.size8,
                      width: context.size8,
                      decoration: BoxDecoration(
                        color: message.isSender ? Colors.white : ApplicationConstants.kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            "0.37",
            style: TextStyle(
              fontSize: 12,
              color: message.isSender ? Colors.white : null,
            ),
          ),
        ],
      ),
    );
  }
}
