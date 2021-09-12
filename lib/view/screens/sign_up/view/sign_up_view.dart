import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/auth_widgets/custom_text_button.dart';
import '../../../_product/auth_widgets/wave_widget.dart';
import '../../../components/custom_text_field.dart';
import '../view_model/sign_up_view_model.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      viewModel: SignUpViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SignUpViewModel viewModel) => Scaffold(
        appBar: AppBar(
          backgroundColor: ApplicationConstants.kPrimaryColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left_sharp,
                size: context.size36,
              ),
              onPressed: () => Navigator.pop(context)),
        ),
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: Stack(
          children: [
            Container(
              height: context.height / 3,
              color: ApplicationConstants.kPrimaryColor,
            ),
            Observer(builder: (_) {
              return AnimatedPositioned(
                duration: context.durationMS250,
                curve: Curves.easeOutQuad,
                top: context.isKeyboardOpen || !viewModel.isValidForm ? -context.height / 3.7 : 0,
                child: WaveWidget(
                  size: context.mediaQuery.size,
                  yOffset: context.height / 5,
                  color: context.theme.scaffoldBackgroundColor,
                ),
              );
            }),
            Hero(
              tag: "AuthLogo",
              child: Container(
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
            buildRegisterForm(viewModel, context),
          ],
        ),
      ),
    );
  }

  Padding buildRegisterForm(SignUpViewModel viewModel, BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          30, context.isKeyboardOpen ? 0 : 30, 30, context.isKeyboardOpen ? 0 : 30),
      child: Container(
        margin: EdgeInsets.only(top: context.isKeyboardOpen ? 50 : 0),
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: context.size14),
          physics: BouncingScrollPhysics(),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Observer(builder: (_) {
                  return CustomTextField(
                    textEditingController: viewModel.nameTEC,
                    labelText: LocaleKeys.name.locale,
                    prefixIconData: Icons.person_outline_outlined,
                    errorText: viewModel.nameErrorText,
                    validator: (value) => viewModel.nameValidation(value),
                    onChanged: (value) {
                      viewModel.nameValidation(value);
                    },
                    currentNode: viewModel.nameNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).requestFocus(viewModel.surnameNode),
                  );
                }),
                SizedBox(height: context.size10),
                Observer(builder: (_) {
                  return CustomTextField(
                    textEditingController: viewModel.surnameTEC,
                    labelText: LocaleKeys.surname.locale,
                    prefixIconData: Icons.person_outline_outlined,
                    errorText: viewModel.surnameErrorText,
                    validator: (value) => viewModel.surnameValidation(value),
                    onChanged: (value) {
                      viewModel.surnameValidation(value);
                    },
                    currentNode: viewModel.surnameNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).requestFocus(viewModel.emailNode),
                  );
                }),
                SizedBox(height: context.size10),
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
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).requestFocus(viewModel.passwordConfirmNode),
                  );
                }),
                SizedBox(height: context.size10),
                Observer(builder: (_) {
                  return CustomTextField(
                    textEditingController: viewModel.passwordConfirmTEC,
                    labelText: LocaleKeys.passwordConfirm.locale,
                    obscureText: viewModel.hidePassword,
                    prefixIconData: Icons.lock_outline,
                    errorText: viewModel.passwordConfirmErrorText,
                    validator: (value) => viewModel.passwordConfirmValidation(value),
                    onChanged: (value) => viewModel.passwordConfirmValidation(value),
                    currentNode: viewModel.passwordConfirmNode,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) => viewModel.register(),
                  );
                }),
                SizedBox(height: context.size20),
                Observer(builder: (_) {
                  return CustomTextButton(
                    title: LocaleKeys.signUp.locale,
                    hasBorder: true,
                    onTap: () => viewModel.register(),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
