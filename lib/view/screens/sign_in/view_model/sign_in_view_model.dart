import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:vexana/vexana.dart';

import '../../../../core/base/model/abstracts/base_view_model.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/constants/enums/locale_preferences_keys_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/network/network_route_enum.dart';
import '../../../_product/models/user_dto.dart';
import '../model/login_model.dart';

part 'sign_in_view_model.g.dart';

class SignInViewModel = _SignInViewModelBase with _$SignInViewModel;

abstract class _SignInViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    if (localeManager.getStringValue(LocalePreferencesKeys.TOKEN) != "") {
      navigation.navigateToPage(path: NavigationConstants.CHATS);
    }
  }

  final formKey = GlobalKey<FormState>();

  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  @observable
  bool hidePassword = true;

  @observable
  String? emailErrorText;
  @observable
  String? passwordErrorText;

  @action
  changeHidePasswordStatus() {
    hidePassword = !hidePassword;
  }

  @action
  emailValidation(String? value) {
    if (value!.isEmpty)
      emailErrorText = LocaleKeys.validation_emailRequired.locale;
    else if (!value.contains(RegExp(ApplicationConstants.EMAIL_REGEX)))
      emailErrorText = LocaleKeys.validation_unvalidEmail.locale;
    else
      emailErrorText = null;

    return emailErrorText;
  }

  @action
  passwordValidation(String? value) {
    if (value!.isEmpty)
      passwordErrorText = LocaleKeys.validation_passwordRequired.locale;
    else if (value.length < 4)
      passwordErrorText = LocaleKeys.validation_passwordMinLength.locale;
    else
      passwordErrorText = null;

    return passwordErrorText;
  }

  @action
  login() async {
    if (formKey.currentState!.validate()) {
      final loginModel = LoginModel(
        userName: emailTEC.text,
        password: passwordTEC.text,
      );
      try {
        final response = await vexanaManagerComputed.networkManager.send<LoginModel, UserDto>(
          NetworkRoutes.LOGIN.rawValue,
          parseModel: LoginModel(),
          method: RequestType.POST,
          data: loginModel.toJson(),
        );

        if (response.error != null) {
          showCustomDialog(
              title: response.error!.statusCode.toString(),
              descriptions: response.error!.description,
              acceptButtonText: LocaleKeys.common_okey.locale);
        } else if (response.data != null) {
          await localeManager.setStringValue(LocalePreferencesKeys.TOKEN, response.data!.token!);

          navigation.navigateToPage(path: NavigationConstants.CHATS);
        }
      } catch (e) {
        print(e);
        Navigator.of(context!, rootNavigator: true).pop();
      }
    } else {
      showCustomDialog(
        title: LocaleKeys.form_unvalidForm.locale,
        acceptButtonText: LocaleKeys.common_okey.locale,
        isDismissible: false,
      );
    }
  }
}
