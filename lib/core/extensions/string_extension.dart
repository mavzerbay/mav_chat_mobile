import 'package:easy_localization/easy_localization.dart';
import 'package:mav_chat/core/constants/app/app_constants.dart';
import 'package:mav_chat/core/init/lang/locale_keys.g.dart';

extension StringExtension on String {
  String get locale => this.tr();

  String? get isValidEmail => this.contains(RegExp(ApplicationConstants.EMAIL_REGEX))
      ? null
      : LocaleKeys.validation_unvalidEmail.locale;
}

extension ImagePathExtension on String {
  String get toSVG => "assets/svg/$this.svg";
}
