import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mav_chat/view/_product/models/user_dto.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../core/extensions/string_extension.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../components/filled_outline_button.dart';
import '../components/chat_card/view/chat_card.dart';
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
                Observer(builder: (_) {
                  return FillOutlineButton(
                    press: () {
                      viewModel.changeSelectedButtonIndex(0);
                    },
                    text: LocaleKeys.recentMessages.locale,
                    isFilled: viewModel.selectedButtonIndex == 0,
                  );
                }),
                SizedBox(width: ApplicationConstants.kDefaultPadding),
                Observer(builder: (_) {
                  return FillOutlineButton(
                    press: () {
                      viewModel.changeSelectedButtonIndex(1);
                    },
                    text: LocaleKeys.active.locale,
                    isFilled: viewModel.selectedButtonIndex == 1,
                  );
                }),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<String>>(
                stream: viewModel.presenceService!.onlineUsers,
                builder: (context, streamSnapshot) {
                  print(streamSnapshot);
                  return FutureBuilder<List<UserDto>>(
                      future: viewModel.getUsers(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData && !snapshot.hasError) {
                          return Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(ApplicationConstants.kPrimaryColor),
                            ),
                          );
                        }
                        if (snapshot.hasError || !snapshot.hasData) {
                          return Container(
                            child: Center(
                              child: Text('Kullanıcı Bulunamadı'),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final isOnline = !streamSnapshot.hasError &&
                                streamSnapshot.hasData &&
                                streamSnapshot.data!
                                    .any((x) => x == snapshot.data![index].userName);
                            return ChatCard(
                              user: snapshot.data![index],
                              isOnline: isOnline,
                              press: () => viewModel.navigation
                                  .navigateToPage(path: NavigationConstants.MESSAGES),
                            );
                          },
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
