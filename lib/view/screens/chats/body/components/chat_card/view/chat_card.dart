import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mav_chat/view/_product/models/user_dto.dart';

import '../../../../../../../core/base/view/base_view.dart';
import '../../../../../../../core/constants/app/app_constants.dart';
import '../../../../../../../core/extensions/context_extension.dart';
import '../view_model/chat_card_view_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.user,
    required this.press,
    this.isOnline = false,
  }) : super(key: key);

  final UserDto user;
  final VoidCallback press;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatCardViewModel>(
      viewModel: ChatCardViewModel(),
      onModelReady: (model) {
        model.userName = user.userName;
        model.setContext(context);
        model.init();
        timeago.setLocaleMessages('tr', timeago.TrMessages());
      },
      onPageBuilder: (BuildContext context, ChatCardViewModel viewModel) => InkWell(
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ApplicationConstants.kDefaultPadding,
            vertical: ApplicationConstants.kDefaultPadding,
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: MemoryImage(Base64Decoder().convert(user.profilePhoto!)),
                  ),
                  if (isOnline) ...[
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: context.size18,
                        width: context.size18,
                        decoration: BoxDecoration(
                          color: ApplicationConstants.kPrimaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: context.theme.scaffoldBackgroundColor, width: context.size3),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: ApplicationConstants.kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name!,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: context.size10),
                      Opacity(
                        opacity: 0.64,
                        child: Text(
                          "user.lastMessage!",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Opacity(
                opacity: 0.64,
                child: Text(
                  timeago.format(DateTime.parse(user.lastActive!), locale: 'tr'),
                ), //TODO: locale e göre ayarlamaları yap
              ),
            ],
          ),
        ),
      ),
    );
  }
}
