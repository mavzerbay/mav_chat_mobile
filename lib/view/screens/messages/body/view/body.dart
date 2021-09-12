import 'package:flutter/material.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../chats/body/models/ChatMessage.dart';
import '../components/chat_input_field.dart';
import '../components/message.dart';
import '../view_model/body_view_model.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BodyViewModel>(
      viewModel: BodyViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, BodyViewModel viewModel) => Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: ApplicationConstants.kDefaultPadding),
              child: ListView.builder(
                itemCount: demeChatMessages.length,
                itemBuilder: (context, index) => Message(message: demeChatMessages[index]),
              ),
            ),
          ),
          ChatInputField(),
        ],
      ),
    );
  }
}
