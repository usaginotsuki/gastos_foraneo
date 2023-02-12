import 'package:flutter/material.dart';
import '../../../../Core/Colors/Hex_Color.dart';

class AppTheme {
  static final TextTheme textTheme = TextTheme(
    displayLarge: _headLine1,
    displayMedium: _headLine2,
    displaySmall: _headLine3,
    headlineMedium: _headLine4,
    headlineSmall: _headLine5,
    titleLarge: _headLine6,
    bodyLarge: _bodyText1,
    bodyMedium: _bodyText2,
    titleMedium: _subTitle1,
    titleSmall: _subTitle2,
    bodySmall: _caption,
  );

  static const TextStyle _headLine1 =
      TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold);

  static final TextStyle _headLine2 = _headLine1.copyWith();
  static final TextStyle _headLine3 = _headLine2.copyWith();
  static final TextStyle _headLine4 = _headLine3.copyWith();
  static final TextStyle _headLine5 = _headLine4.copyWith();
  static final TextStyle _headLine6 =
      _headLine5.copyWith(fontFamily: 'Akrobat');
  static final TextStyle _subTitle1 = _headLine6.copyWith();
  static final TextStyle _subTitle2 = _subTitle1.copyWith();
  static final TextStyle _bodyText1 = _subTitle2.copyWith();
  static final TextStyle _bodyText2 = _bodyText1.copyWith();
  static final TextStyle _caption = _bodyText2.copyWith();

  static ThemeData themeData(bool ligthMode) {
    return ThemeData(
        primaryColor: HexColor("#4b4293"),
        primaryColorDark: HexColor("#14213d"),
        primaryColorLight: HexColor("#e5e5e5"),
        tabBarTheme: TabBarTheme(
            unselectedLabelColor: Colors.grey,
            labelColor: ligthMode ? HexColor("#40916c") : Colors.white),
        colorScheme: ColorScheme(
          primary: HexColor("#4b4293"),
          primaryVariant: HexColor("#e5e5e5"),
          secondary: HexColor("#14213d"),
          surface: Colors.white,
          background: Colors.white70,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: const Color.fromRGBO(43, 45, 66, 1),
          onSurface: const Color.fromRGBO(43, 45, 66, 1),
          onBackground: const Color.fromRGBO(43, 45, 66, 1),
          onError: Colors.white,
          brightness: ligthMode ? Brightness.dark : Brightness.light,
        ),
        textTheme: textTheme);
  }
}
