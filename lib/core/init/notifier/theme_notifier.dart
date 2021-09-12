import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mav_chat/core/init/theme/app_theme_dark.dart';

import '../../constants/enums/app_theme_enum.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  ThemeData get lightTheme => AppThemeLight.instance.theme;
  ThemeData get darkTheme => AppThemeDark.instance.theme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }

    notifyListeners();
  }
}
