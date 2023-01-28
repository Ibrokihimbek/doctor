import 'package:doctor_app/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoctorUzTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFCFD5DE),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Color(0xFFCFD5DE),
      ),
    ),
    hintColor: Colors.grey,
    scaffoldBackgroundColor: const Color(0xFFE5E5E5),
    colorScheme: const ColorScheme.light(),
    primaryColorDark: const Color(0xFFCFD5DE),
    primaryColor: const Color(0xFFFFFFFF),
    useMaterial3: true,
    cardColor: Colors.black,
    shadowColor: Colors.grey.shade300,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    splashColor: Colors.grey.shade300,
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.black.withOpacity(0.3)),
      headline2: TextStyle(color: Colors.black.withOpacity(0.4)),
      headline3: TextStyle(color: Colors.black.withOpacity(0.5)),
      headline4: TextStyle(color: Colors.black.withOpacity(0.6)),
      headline5: TextStyle(color: Colors.black.withOpacity(0.7)),
      headline6: TextStyle(color: Colors.black.withOpacity(0.8)),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF191C1F),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Color(0xFF191C1F),
        )),
    useMaterial3: true,
    splashColor: const Color(0xFF191C1F),
    hintColor: Colors.grey,
    cardColor: Colors.white,
    scaffoldBackgroundColor: const Color(0xFF191C1F),
    primaryColor: MyColors.primary,
    colorScheme: const ColorScheme.dark(),
    primaryColorDark: const Color(0xFF536872),
    shadowColor: Colors.grey.shade500,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.white.withOpacity(0.3)),
      headline2: TextStyle(color: Colors.white.withOpacity(0.4)),
      headline3: TextStyle(color: Colors.white.withOpacity(0.5)),
      headline4: TextStyle(color: Colors.white.withOpacity(0.6)),
      headline5: TextStyle(color: Colors.white.withOpacity(0.7)),
      headline6: TextStyle(color: Colors.white.withOpacity(0.8)),
    ),
  );
}
