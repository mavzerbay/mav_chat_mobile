import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mav_chat/core/constants/app/app_constants.dart';
import 'package:mav_chat/core/extensions/context_extension.dart';
import 'package:mav_chat/view/_product/models/message.dart';

class VideoMessage extends StatelessWidget {
  const VideoMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.45,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.memory((Base64Decoder().convert(message.file!))),
            ),
            Container(
              height: context.size26,
              width: context.size26,
              decoration: BoxDecoration(
                color: ApplicationConstants.kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.play_arrow,
                size: context.size16,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
