import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    return _instance ??= AppThemeDark._init();
  }

  AppThemeDark._init();

  ThemeData get theme => ThemeData.dark().copyWith(
        primaryColor: ApplicationConstants.kPrimaryColor,
        scaffoldBackgroundColor: ApplicationConstants.kContentColorLightTheme,
        appBarTheme: AppBarTheme(centerTitle: false, elevation: 0),
        iconTheme: IconThemeData(color: ApplicationConstants.kContentColorDarkTheme),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme)
            .apply(bodyColor: ApplicationConstants.kContentColorDarkTheme),
        colorScheme: ColorScheme.dark().copyWith(
          primary: ApplicationConstants.kPrimaryColor,
          secondary: ApplicationConstants.kSecondaryColor,
          error: ApplicationConstants.kErrorColor,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ApplicationConstants.kContentColorDarkTheme,
          selectedItemColor: Colors.white70,
          unselectedItemColor: ApplicationConstants.kContentColorDarkTheme.withOpacity(0.32),
          selectedIconTheme: IconThemeData(color: ApplicationConstants.kPrimaryColor),
        ),
      );
}
