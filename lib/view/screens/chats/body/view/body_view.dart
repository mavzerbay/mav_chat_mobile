import 'package:flutter/material.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../core/extensions/string_extension.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../components/filled_outline_button.dart';
import '../components/chat_card.dart';
import '../models/Chat.dart';
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
          Container(
            padding: EdgeInsets.fromLTRB(ApplicationConstants.kDefaultPadding, 0,
                ApplicationConstants.kDefaultPadding, ApplicationConstants.kDefaultPadding),
            color: ApplicationConstants.kPrimaryColor,
            child: Row(
              children: [
                FillOutlineButton(
                  press: () {},
                  text: LocaleKeys.recentMessages.locale,
                ),
                SizedBox(width: ApplicationConstants.kDefaultPadding),
                FillOutlineButton(
                  press: () {},
                  text: LocaleKeys.active.locale,
                  isFilled: false,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) => ChatCard(
                chat: chatsData[index],
                press: () =>
                    viewModel.navigation.navigateToPage(path: NavigationConstants.MESSAGES),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
