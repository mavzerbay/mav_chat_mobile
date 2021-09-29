import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mav_chat/view/_product/models/user_dto.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../body/view/body.dart';
import '../view_model/messages_view_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessagesView extends StatelessWidget {
  const MessagesView({
    Key? key,
    required this.userDto,
  }) : super(key: key);

  final UserDto userDto;

  @override
  Widget build(BuildContext context) {
    return BaseView<MessagesViewModel>(
      viewModel: MessagesViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        timeago.setLocaleMessages('tr', timeago.TrMessages());
      },
      onPageBuilder: (BuildContext context, MessagesViewModel viewModel) => Scaffold(
        appBar: buildAppBar(context),
        body: Body(userDto:userDto),
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
            backgroundImage: MemoryImage(Base64Decoder().convert(userDto.profilePhoto!)),
          ),
          SizedBox(width: ApplicationConstants.kDefaultPadding * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userDto.nameSurname!,
                style: TextStyle(
                  fontSize: context.size18,
                ),
              ),
              Text(
                timeago.format(DateTime.parse(userDto.lastActive!), locale: 'tr'),
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
