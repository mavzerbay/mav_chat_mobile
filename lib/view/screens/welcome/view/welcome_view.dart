import 'package:flutter/material.dart';
import 'package:mav_chat/core/constants/navigation/navigation_constants.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../view_model/welcome_view_model.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<WelcomeViewModel>(
      viewModel: WelcomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, WelcomeViewModel viewModel) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Spacer(flex: 2),
              Image.asset('assets/images/welcome_image.png'),
              Spacer(flex: 3),
              Text(
                LocaleKeys.welcome.locale,
                textAlign: TextAlign.center,
                style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
              ),
              Spacer(flex: 3),
              FittedBox(
                child: TextButton(
                  onPressed: () => viewModel.navigation.navigateToPage(path: NavigationConstants.SIGN_IN),
                  child: Row(
                    children: [
                      Text(
                        LocaleKeys.skip.locale,
                        style: context.textTheme.bodyText1!.copyWith(
                          color: context.textTheme.bodyText1!.color!.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(width: ApplicationConstants.kDefaultPadding / 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: context.textTheme.bodyText1!.color!.withOpacity(0.8),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
