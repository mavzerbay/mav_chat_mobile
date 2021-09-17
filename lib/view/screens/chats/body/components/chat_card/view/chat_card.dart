import 'package:flutter/material.dart';

import '../../../../../../../core/base/view/base_view.dart';
import '../../../../../../../core/constants/app/app_constants.dart';
import '../../../../../../../core/extensions/context_extension.dart';
import '../../../models/Chat.dart';
import '../view_model/chat_card_view_model.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chat,
    required this.press,
  }) : super(key: key);

  final Chat chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatCardViewModel>(
      viewModel: ChatCardViewModel(),
      onModelReady: (model) {
        model.userName = chat.userName;
        model.setContext(context);
        model.init();
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
                    backgroundImage: AssetImage(chat.image),
                  ),
                  StreamBuilder<List<String>>(
                    stream: viewModel.presenceService!.onlineUsers$,
                    builder: (context, snapshot) {
                      if (snapshot.hasError || !snapshot.hasData) {
                        return Container();
                      }
                      if (snapshot.hasData && snapshot.data!.any((x) => x == chat.userName)) {
                        return Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: context.size18,
                            width: context.size18,
                            decoration: BoxDecoration(
                              color: ApplicationConstants.kPrimaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: context.theme.scaffoldBackgroundColor,
                                  width: context.size3),
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
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
                        chat.name,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: context.size10),
                      Opacity(
                        opacity: 0.64,
                        child: Text(
                          chat.lastMessage,
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
                child: Text(chat.time),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
