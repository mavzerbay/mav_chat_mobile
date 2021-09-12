import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData.light().copyWith(
        primaryColor: ApplicationConstants.kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(centerTitle: false, elevation: 0),
        iconTheme: IconThemeData(color: ApplicationConstants.kContentColorLightTheme),
        textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme)
            .apply(bodyColor: ApplicationConstants.kContentColorLightTheme),
        colorScheme: ColorScheme.light(
          primary: ApplicationConstants.kPrimaryColor,
          secondary: ApplicationConstants.kSecondaryColor,
          error: ApplicationConstants.kErrorColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: ApplicationConstants.kContentColorLightTheme.withOpacity(0.7),
          unselectedItemColor: ApplicationConstants.kContentColorLightTheme.withOpacity(0.32),
          selectedIconTheme: IconThemeData(color: ApplicationConstants.kPrimaryColor),
        ),
      );
}
