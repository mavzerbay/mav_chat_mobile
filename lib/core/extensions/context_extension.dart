import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom > 0;
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double dynamicWidth(double val) => width * val;
  double dynamicHeight(double val) => height * val;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;

  double get safeWidth => width - (mediaQuery.padding.left + mediaQuery.padding.right);
  double get safeHeight => width - (mediaQuery.padding.top + mediaQuery.padding.bottom);

  double get scaleFactorHeight => safeHeight / 820 < 1
      ? safeHeight / 820 + ((1 - safeHeight / 820) * (1 - safeHeight / 820))
      : safeHeight / 820;

  double get scaleFactorWidth => safeWidth / 392 < 1
      ? safeWidth / 392 + ((1 - safeWidth / 392) * (1 - safeWidth / 392))
      : safeWidth / 392;

  double get size0 => 0;
  double get size2 => scaleFactorHeight * 2;
  double get size3 => scaleFactorHeight * 3;
  double get size4 => scaleFactorHeight * 4;
  double get size5 => scaleFactorHeight * 5;
  double get size6 => scaleFactorHeight * 6;
  double get size8 => scaleFactorHeight * 8;
  double get size9 => scaleFactorHeight * 9;
  double get size10 => scaleFactorHeight * 10;
  double get size12 => scaleFactorHeight * 12;
  double get size14 => scaleFactorHeight * 14;
  double get size16 => scaleFactorHeight * 16;
  double get size18 => scaleFactorHeight * 18;
  double get size20 => scaleFactorHeight * 20;
  double get size22 => scaleFactorHeight * 22;
  double get size24 => scaleFactorHeight * 24;
  double get size26 => scaleFactorHeight * 26;
  double get size28 => scaleFactorHeight * 28;
  double get size30 => scaleFactorHeight * 30;
  double get size32 => scaleFactorHeight * 32;
  double get size34 => scaleFactorHeight * 34;
  double get size36 => scaleFactorHeight * 36;
  double get size38 => scaleFactorHeight * 38;
  double get size40 => scaleFactorHeight * 40;
  double get size42 => scaleFactorHeight * 42;
  double get size44 => scaleFactorHeight * 44;
  double get size46 => scaleFactorHeight * 46;
  double get size48 => scaleFactorHeight * 48;
  double get size50 => scaleFactorHeight * 50;
  double get size52 => scaleFactorHeight * 52;
  double get size54 => scaleFactorHeight * 54;
  double get size56 => scaleFactorHeight * 56;
  double get size58 => scaleFactorHeight * 58;
  double get size60 => scaleFactorHeight * 60;
  double get size62 => scaleFactorHeight * 62;
  double get size64 => scaleFactorHeight * 64;
  double get size66 => scaleFactorHeight * 66;
  double get size68 => scaleFactorHeight * 68;
  double get size70 => scaleFactorHeight * 70;
  double get size72 => scaleFactorHeight * 72;
  double get size74 => scaleFactorHeight * 74;
  double get size78 => scaleFactorHeight * 78;
  double get size80 => scaleFactorHeight * 80;
  double get size82 => scaleFactorHeight * 82;
  double get size84 => scaleFactorHeight * 84;
  double get size86 => scaleFactorHeight * 86;
  double get size88 => scaleFactorHeight * 88;
  double get size90 => scaleFactorHeight * 90;
  double get size92 => scaleFactorHeight * 92;
  double get size94 => scaleFactorHeight * 94;
  double get size96 => scaleFactorHeight * 96;
  double get size98 => scaleFactorHeight * 98;
  double get size100 => scaleFactorHeight * 100;
  double get size120 => scaleFactorHeight * 120;
  double get size140 => scaleFactorHeight * 140;
  double get size160 => scaleFactorHeight * 160;
  double get size180 => scaleFactorHeight * 180;
  double get size200 => scaleFactorHeight * 200;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colors => theme.colorScheme;

  ColorScheme get buttonColors => theme.buttonTheme.colorScheme!;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical => EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical => EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical => EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal => EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal => EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal => EdgeInsets.symmetric(horizontal: highValue);
}

extension PageExtension on BuildContext {
  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext {
  Duration get durationMS500 => Duration(milliseconds: 500);
  Duration get durationMS250 => Duration(milliseconds: 250);
  Duration get durationS1 => Duration(seconds: 1);
}
