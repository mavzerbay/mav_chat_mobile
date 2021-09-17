import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:signalr_core/signalr_core.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/constants/app/app_constants.dart';
import '../../../../../core/constants/enums/locale_preferences_keys_enum.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../../../../../core/extensions/string_extension.dart';
import '../../../../../core/init/cache/locale_manager.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
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
          onPressed: () {
            if (viewModel.presenceService!.hubConnection!.state == HubConnectionState.connected) {
              viewModel.presenceService!.stopHubConnection();
            } else {
              viewModel.presenceService!.createHubConnection(
                  LocaleManager.instance.getStringValue(LocalePreferencesKeys.TOKEN));
            }
            print(viewModel.presenceService!.hubConnection!.state);
          },
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

  Widget buildBottomNavigationBar(ChatsViewModel viewModel, BuildContext context) {
    return StreamBuilder<List<String>>(
        stream: viewModel.presenceService!.onlineUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            viewModel.currentUserIsOnline(snapshot.data!);
          }
          return Observer(builder: (_) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: viewModel.selectedIndex,
              onTap: (index) async => await viewModel.changeIndex(index),
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
                  icon: Stack(
                    children: [
                      CircleAvatar(
                        radius: context.size20,
                        backgroundImage: AssetImage("assets/images/user_2.png"),
                      ),
                      if (viewModel.isOnline) ...[
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
                                  color: context.theme.scaffoldBackgroundColor,
                                  width: context.size3),
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                  label: LocaleKeys.profile.locale,
                ),
              ],
            );
          });
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
