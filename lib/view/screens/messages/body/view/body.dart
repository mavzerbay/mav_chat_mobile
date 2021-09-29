import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mav_chat/view/_product/models/user_dto.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../components/chat_input_field.dart';
import '../components/message_card.dart';
import '../view_model/body_view_model.dart';
import 'package:mav_chat/view/_product/models/message.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.userDto,
  }) : super(key: key);

  final UserDto userDto;
  @override
  Widget build(BuildContext context) {
    return BaseView<BodyViewModel>(
      viewModel: BodyViewModel(),
      onModelReady: (model) {
        model.receiverUserName = userDto.userName!;
        model.setContext(context);
        model.init();
      },
      onDispose: (model) {
        model.dispose();
      },
      onPageBuilder: (BuildContext context, BodyViewModel viewModel) => Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: ApplicationConstants.kDefaultPadding),
              child: StreamBuilder<List<Message>>(
                  stream: viewModel.messageService!.messageThread,
                  builder: (context, snapshot) {
                    print(snapshot);
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (!snapshot.hasError && !snapshot.hasData) {
                      return CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(ApplicationConstants.kPrimaryColor),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        bool isSender = false;
                        print(viewModel.currentUserName);
                        if (viewModel.currentUserName != "" &&
                            snapshot.data![index].sender!.userName == viewModel.currentUserName) {
                          isSender = true;
                        }
                        return MessageCard(message: snapshot.data![index], isSender: isSender);
                      },
                    );
                  }),
            ),
          ),
          Observer(builder: (_) {
            return ChatInputField(
              sendButtonVisible: viewModel.showSendButton,
              tec: viewModel.chatTEC,
              onChanged: () {
                viewModel.hideOrShowSendButton();
              },
              onPressedSendButton: () => viewModel.sendMessage(),
            );
          }),
        ],
      ),
    );
  }
}
