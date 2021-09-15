import 'package:flutter/material.dart';

class ApplicationConstants {
  static const LANG_ASSET_PATH = "assets/lang";
  static const FONT_FAMILY = "Poppins";
  static const COMPANY_NAME = "MAV";
  static const EMAIL_REGEX = '^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}\$';
  
  static const String iosBaseUrl = 'https://localhost:5001'; //localhost:5001
  static const String androidBaseUrl = 'https://10.0.2.2:5001'; //10.0.2.2:5001

  static const kPrimaryColor = Color(0xFF23b3bc);
  static const kSecondaryColor = Color(0xFF76f0f7);
  static const kContentColorLightTheme = Color(0xFF1D1D35);
  static const kContentColorDarkTheme = Color(0xFFF5FCF9);
  static const kWarninngColor = Color(0xFFF3BB1C);
  static const kErrorColor = Color(0xFFF03738);

  static const kDefaultPadding = 20.0;
}
