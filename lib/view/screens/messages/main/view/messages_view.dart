import 'package:flutter/material.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../body/view/body.dart';
import '../view_model/messages_view_model.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MessagesViewModel>(
      viewModel: MessagesViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, MessagesViewModel viewModel) => Scaffold(
        appBar: buildAppBar(context),
        body: Body(),
      ),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            BackButton(),
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/user_2.png"),
            ),
            SizedBox(width: ApplicationConstants.kDefaultPadding * 0.75),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kristin Watson",
                  style: TextStyle(
                    fontSize: context.size18,
                  ),
                ),
                Text(
                  "Active 3m ago",
                  style: TextStyle(fontSize: context.size14),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.local_phone),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          SizedBox(width: ApplicationConstants.kDefaultPadding),
        ],
      );
  }
}
