import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/abstracts/base_view_model.dart';
import '../../../../core/base/model/concrete/base_error.dart';
import '../../../../core/constants/app/app_constants.dart';
import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../../core/init/network/network_route_enum.dart';
import '../../../_product/models/user_dto.dart';
import '../model/register_model.dart';

part 'sign_up_view_model.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  final formKey = GlobalKey<FormState>();

  TextEditingController nameTEC = new TextEditingController();
  TextEditingController surnameTEC = new TextEditingController();
  TextEditingController emailTEC = new TextEditingController();
  TextEditingController passwordTEC = new TextEditingController();
  TextEditingController passwordConfirmTEC = new TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode surnameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode passwordConfirmNode = FocusNode();

  @observable
  bool hidePassword = true;

  @observable
  bool isValidForm = true;

  //TextFields errorTexts
  @observable
  String? passwordErrorText;
  @observable
  String? passwordConfirmErrorText;
  @observable
  String? nameErrorText;
  @observable
  String? surnameErrorText;
  @observable
  String? emailErrorText;

  @action
  changeHidePasswordStatus() {
    hidePassword = !hidePassword;
  }

  @action
  bool formIsValid() {
    if (formKey.currentState != null && formKey.currentState!.validate())
      isValidForm = true;
    else
      isValidForm = false;

    return isValidForm;
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
  passwordConfirmValidation(String? value) {
    if (value!.isEmpty)
      passwordConfirmErrorText = LocaleKeys.validation_passwordConfirmRequired.locale;
    else if (value != passwordTEC.text)
      passwordConfirmErrorText = LocaleKeys.validation_passwordConfirmRequired;
    else
      passwordConfirmErrorText = null;
    return passwordConfirmErrorText;
  }

  @action
  nameValidation(String? value) {
    if (value!.isEmpty)
      nameErrorText = LocaleKeys.validation_nameRequired.locale;
    else
      nameErrorText = null;
    return nameErrorText;
  }

  @action
  surnameValidation(String? value) {
    if (value!.isEmpty)
      surnameErrorText = LocaleKeys.validation_surnameRequired.locale;
    else
      surnameErrorText = null;
    return surnameErrorText;
  }

  @action
  register() async {
    if (formIsValid()) {
      final registerModel = RegisterModel(
        name: nameTEC.text,
        surname: surnameTEC.text,
        email: emailTEC.text,
        password: passwordTEC.text,
        passwordConfirm: passwordConfirmTEC.text,
      );
      try {
        final response = await networkManager!.send<UserDto, UserDto>(
          NetworkRoutes.REGISTER.rawValue,
          parseModel: UserDto(),
          type: HttpTypes.POST,
          data: registerModel.toJson(),
        );

        if (response.error != null) {
          showCustomDialog(
              title: (response.error! as BaseError).error,
              descriptions: (response.error! as BaseError).description,
              acceptButtonText: LocaleKeys.common_okey.locale);
        } else if (response.data != null) {
          showCustomDialog(
              title: "Kayıt İşlemi Başarılı",
              descriptions: "Bilgileriniz ile giriş yapabilirsiniz",
              icon: Icons.check,
              iconColor: Colors.green,
              acceptButtonText: LocaleKeys.common_okey.locale,
              isDismissible: false,
              acceptButtonFunc: () {
                navigation.navigateToPage(path: NavigationConstants.SIGN_IN);
              });
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
