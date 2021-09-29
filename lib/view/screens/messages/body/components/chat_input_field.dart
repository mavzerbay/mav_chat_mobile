import 'package:flutter/material.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';

import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/extensions/string_extension.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
    required this.tec,
    required this.onChanged,
    required this.sendButtonVisible,
    required this.onPressedSendButton,
  }) : super(key: key);

  final TextEditingController tec;
  final VoidCallback onChanged;
  final bool sendButtonVisible;
  final Function()? onPressedSendButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ApplicationConstants.kDefaultPadding,
        vertical: ApplicationConstants.kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: context.theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 32,
            color: Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Icon(
              Icons.mic,
              color: ApplicationConstants.kPrimaryColor,
            ),
            SizedBox(width: ApplicationConstants.kDefaultPadding),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ApplicationConstants.kDefaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: ApplicationConstants.kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: context.textTheme.bodyText1!.color!.withOpacity(0.64),
                    ),
                    SizedBox(width: ApplicationConstants.kDefaultPadding / 4),
                    Expanded(
                      child: TextField(
                        controller: tec,
                        onChanged: (value) {
                          onChanged();
                        },
                        decoration: InputDecoration(
                          hintText: LocaleKeys.messageHint.locale,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    if (!sendButtonVisible) ...[
                      Icon(
                        Icons.attach_file,
                        color: context.textTheme.bodyText1!.color!.withOpacity(0.64),
                      ),
                      Icon(
                        Icons.camera_alt_outlined,
                        color: context.textTheme.bodyText1!.color!.withOpacity(0.64),
                      ),
                    ] else ...[
                      IconButton(
                        icon: Icon(Icons.send, color: ApplicationConstants.kPrimaryColor),
                        onPressed: onPressedSendButton,
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
