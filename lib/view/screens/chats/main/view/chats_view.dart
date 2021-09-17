import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/constants/enums/locale_preferences_keys_enum.dart';
import '../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/extensions/string_extension.dart';
import '../../../../../core/init/cache/locale_manager.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../../core/utils/jwt_utils.dart';
import '../../body/view/body_view.dart';
import '../view_model/chats_view_model.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatsViewModel>(
      viewModel: ChatsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ChatsViewModel viewModel) => Scaffold(
        appBar: buildAppBar(),
        body: Body(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ApplicationConstants.kPrimaryColor,
          child: Icon(
            Icons.person_add_alt_1,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: buildBottomNavigationBar(viewModel, context),
      ),
    );
  }

  Observer buildBottomNavigationBar(ChatsViewModel viewModel, BuildContext context) {
    return Observer(builder: (_) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: viewModel.selectedIndex,
        onTap: (index) {
          if (index != 3) {
            viewModel.changeIndex(index);
          } else {
            LocaleManager.instance.removeValue(LocalePreferencesKeys.TOKEN);
            viewModel.navigation.navigateToPageClear(path: NavigationConstants.SIGN_IN);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.messenger,
            ),
            label: LocaleKeys.chats.locale,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            label: LocaleKeys.peoples.locale,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
            ),
            label: LocaleKeys.calls.locale,
          ),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: context.size16,
                backgroundImage: AssetImage("assets/images/user_2.png"),
              ),
              label: LocaleKeys.profile.locale,
              activeIcon: Stack(
                children: [
                  StreamBuilder<List<String>>(
                    stream: viewModel.presenceService!.onlineUsersSource,
                    builder: (context, snapshot) {
                      print(JwtUtils.parseJwt(viewModel.localeManager
                          .getStringValue(LocalePreferencesKeys.TOKEN))['token']);
                      if (snapshot.hasError || !snapshot.hasData) {
                        return Container();
                      }
                      if (snapshot.hasData &&
                          snapshot.data!.any((x) =>
                              x ==
                              JwtUtils.parseJwt(viewModel.localeManager
                                  .getStringValue(LocalePreferencesKeys.TOKEN))['token'])) {
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
              )),
        ],
      );
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(LocaleKeys.chats.locale),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
