import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/navigation/navigation_route.dart';
import '../../../_product/auth_widgets/custom_text_button.dart';
import '../../../_product/auth_widgets/wave_widget.dart';
import '../../../components/custom_text_field.dart';
import '../view_model/sign_in_view_model.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SignInViewModel>(
      viewModel: SignInViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SignInViewModel viewModel) => Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: Stack(
          children: [
            Container(
              height: context.height - 200,
              color: ApplicationConstants.kPrimaryColor,
            ),
            AnimatedPositioned(
              duration: context.durationMS250,
              curve: Curves.easeOutQuad,
              top: context.isKeyboardOpen ? -context.height / 3.7 : 0,
              child: WaveWidget(
                size: context.mediaQuery.size,
                yOffset: context.height / 3,
                color: context.theme.scaffoldBackgroundColor,
              ),
            ),
            Hero(
              tag: "AuthLogo",
              child: Container(
                margin: EdgeInsets.only(top: kToolbarHeight),
                alignment: Alignment.topCenter,
                height: context.isKeyboardOpen ? 0 : context.width / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.theme.scaffoldBackgroundColor,
                ),
                child: Image.asset(
                  "assets/images/Logo_dark.png",
                  color: ApplicationConstants.kPrimaryColor,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            buildLoginForm(viewModel, context),
          ],
        ),
      ),
    );
  }

  Padding buildLoginForm(SignInViewModel viewModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Observer(builder: (_) {
              return CustomTextField(
                textEditingController: viewModel.emailTEC,
                labelText: LocaleKeys.email.locale,
                prefixIconData: Icons.mail_outline,
                suffixIconData: viewModel.emailErrorText == null ? Icons.check : null,
                errorText: viewModel.emailErrorText,
                validator: (value) => viewModel.emailValidation(value),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  viewModel.emailValidation(value);
                },
                currentNode: viewModel.emailNode,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) =>
                    FocusScope.of(context).requestFocus(viewModel.passwordNode),
              );
            }),
            SizedBox(height: context.size10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                  Observer(builder: (_) {
                    return CustomTextField(
                      textEditingController: viewModel.passwordTEC,
                      labelText: LocaleKeys.password.locale,
                      obscureText: viewModel.hidePassword,
                      prefixIconData: Icons.lock_outline,
                      suffixIconData:
                          viewModel.hidePassword ? Icons.visibility_off : Icons.visibility,
                      suffixIconPressed: () => viewModel.changeHidePasswordStatus(),
                      errorText: viewModel.passwordErrorText,
                      validator: (value) => viewModel.passwordValidation(value),
                      onChanged: (value) => viewModel.passwordValidation(value),
                      currentNode: viewModel.passwordNode,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) =>
                          viewModel.login(),
                    );
                  }),
                SizedBox(height: context.size10),
                Text(
                  LocaleKeys.forgotPassword.locale,
                  style: TextStyle(
                    color: ApplicationConstants.kPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: context.size20),
            CustomTextButton(
              title: LocaleKeys.signIn.locale,
              onTap: () => viewModel.login(),
            ),
            SizedBox(height: context.size10),
            CustomTextButton(
              title: LocaleKeys.signUp.locale,
              hasBorder: true,
              onTap: () => viewModel.navigation.navigateToPage(
                path: NavigationConstants.SIGN_UP,
                data: NavigationData(routeWithAnimation: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
