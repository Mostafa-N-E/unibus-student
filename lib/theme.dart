import 'dart:ui';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import 'config.dart';

class LightThemeColors {
  // static const primaryColor = Color(0xfffff3eb);
  // static const scaffoldBackgroundColor = Color(0xfffff9f3);
  // static const bottomAppBarColor = Color(0xfffff5ed);
  // static const backgroundColor = Color(0xfffff7ee);
  // static const cardColor = Color(0xfffff5ed);
  // static const secondaryColor = Color(0xFFEB1555);
  // static const primaryTextColor = Color(0xff262A35);
  // static const secondaryTextColor = Color(0xffB3B6BE);
  // static const shadowColor = Color(0xff7e7e7e);
  static const primaryColor = Color(0xffffffff);
  static const scaffoldBackgroundColor = Color(0xfffdfdfd);
  static const bottomAppBarColor = Color(0xffffffff);
  static const backgroundColor = Color(0xffffffff);
  static const cardColor = Color(0xfffcfcfc);
  // static const secondaryColor = Color(0xFF0468d7);
  static const secondaryColor = Color(0xff008abb);
  static const primaryTextColor = Color(0xff262A35);
  static const secondaryTextColor = Color(0xff00a6cb);
  static const shadowColor = Color(0xff00d9ff);
}

class DarkThemeColors {
  static const primaryColor = Color(0xff0a0d22);
  static const scaffoldBackgroundColor = Color(0xff0a0d22);
  static const bottomAppBarColor = Color(0xff0a0d22);
  static const backgroundColor = Color(0xff0a0d22);
  static const cardColor = Color(0xFF111328);
  static const secondaryColor = Color(0xFFEB1555);
  static const primaryTextColor = Color(0xff262A35);
  static const secondaryTextColor = Color(0xffffade5);
  static const shadowColor = Color(0xffffade5);
}




class AppTheme {
  static MyTheme get currentTheme => GetIt.I<MyTheme>();
  static ThemeMode get themeMode => GetIt.I<MyTheme>().currentTheme();

  static ThemeData lightTheme({
    required BuildContext context,
  }) {
    return ThemeData(
      primaryIconTheme: IconThemeData(color: Colors.black87),
      // actionIconTheme: ActionIconThemeData(color: Colors.black87),
      // iconButtonTheme: IconButtonThemeData(
      //   style: ButtonStyle(
      //       iconColor:
      //   )
      // ),

      splashColor: LightThemeColors.shadowColor,
      shadowColor: LightThemeColors.shadowColor,
      // backgroundColor: LightThemeColors.backgroundColor,
      scaffoldBackgroundColor: LightThemeColors.scaffoldBackgroundColor,
      fontFamily: 'Sahel',
      // primaryColor: Colors.blue,
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: LightThemeColors.primaryColor,//currentTheme.currentColor(),
        cursorColor: LightThemeColors.primaryColor,//currentTheme.currentColor(),
        selectionColor: LightThemeColors.primaryColor,//currentTheme.currentColor(),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide:
          BorderSide(width: 1.5, color: LightThemeColors.primaryColor,//currentTheme.currentColor()
    ),
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        shadowColor: LightThemeColors.shadowColor,
        backgroundColor: LightThemeColors.bottomAppBarColor,//currentTheme.currentColor(),
      ),
      cardTheme: CardTheme(
        shadowColor: LightThemeColors.shadowColor,
        color: LightThemeColors.cardColor,
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      disabledColor: Colors.grey[600],
      brightness: Brightness.light,
      indicatorColor: LightThemeColors.primaryColor,//currentTheme.currentColor(),
      progressIndicatorTheme: const ProgressIndicatorThemeData()
          .copyWith(
          color: LightThemeColors.primaryColor,//currentTheme.currentColor()
      ),
      iconTheme: IconThemeData(
        color: Colors.grey[800],
        opacity: 1.0,
        size: 24.0,
      ),
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: Colors.grey[800],
        brightness: Brightness.light,
        secondary: LightThemeColors.secondaryColor,//currentTheme.currentColor(),

      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w800, color: Colors.grey.shade100),
        displayMedium: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700, color: Colors.grey.shade100),
        displaySmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.grey.shade100),
        headlineLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800, color: Colors.grey.shade100),
        headlineMedium: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.grey.shade100),
        headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.grey.shade100),
        titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.grey.shade100),
        titleMedium: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.grey.shade100, ),
        titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.grey.shade100),
        bodyLarge: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: Colors.grey.shade100),
        bodyMedium: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500, color: Colors.grey.shade100),
        bodySmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500, color: Colors.grey.shade100),
        labelLarge: TextStyle(fontSize: 9.0, fontWeight: FontWeight.w600, color: Colors.grey.shade100),
        labelMedium: TextStyle(fontSize: 8.0, fontWeight: FontWeight.w600, color: Colors.grey.shade100),
        labelSmall: TextStyle(fontSize: 7.0, fontWeight: FontWeight.w600, color: Colors.grey.shade100),

      ),
    );
  }

  static ThemeData darkTheme({
    required BuildContext context,
  }) {
    return ThemeData(
      splashColor: DarkThemeColors.shadowColor,
      shadowColor: DarkThemeColors.shadowColor,
      // backgroundColor: DarkThemeColors.backgroundColor,
      scaffoldBackgroundColor: DarkThemeColors.scaffoldBackgroundColor,
      fontFamily: 'Sahel',
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: DarkThemeColors.cardColor,//Colors.transparent,
          elevation: 0.0,
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: DarkThemeColors.secondaryColor,//currentTheme.currentColor(),
        cursorColor: DarkThemeColors.secondaryColor,//currentTheme.currentColor(),
        selectionColor: DarkThemeColors.secondaryColor,//currentTheme.currentColor(),
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
          borderSide:
          BorderSide(
              width: 1.5, color: DarkThemeColors.secondaryColor,//currentTheme.currentColor()
          ),
        ),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        shadowColor: DarkThemeColors.shadowColor,
        color: DarkThemeColors.bottomAppBarColor,//currentTheme.getCanvasColor(),
        foregroundColor: Colors.white,
      ),
      canvasColor: DarkThemeColors.cardColor,//currentTheme.getCanvasColor(),
      cardColor: DarkThemeColors.cardColor,//currentTheme.getCardColor(),
      cardTheme: CardTheme(
        shadowColor: DarkThemeColors.shadowColor,
        color: DarkThemeColors.cardColor,
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
      dialogBackgroundColor: LightThemeColors.primaryColor,//currentTheme.getCardColor(),
      progressIndicatorTheme: const ProgressIndicatorThemeData()
          .copyWith(
        color: LightThemeColors.primaryColor,//currentTheme.currentColor()
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
        opacity: 1.0,
        size: 24.0,
      ),
      indicatorColor: LightThemeColors.primaryColor,//currentTheme.currentColor(),
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: Colors.white,
        secondary: DarkThemeColors.secondaryColor,//currentTheme.currentColor(),
        brightness: Brightness.dark,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w800, color: Colors.grey.shade700),
        displayMedium: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700, color: Colors.grey.shade700),
        displaySmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        headlineLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w800, color: Colors.grey.shade700),
        headlineMedium: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.grey.shade700),
        headlineSmall: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        titleMedium: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Colors.grey.shade700, ),
        titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.grey.shade700),
        bodyLarge: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        bodyMedium: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500, color: Colors.grey.shade800),
        bodySmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500, color: Colors.grey.shade700),
        labelLarge: TextStyle(fontSize: 9.0, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        labelMedium: TextStyle(fontSize: 8.0, fontWeight: FontWeight.w600, color: Colors.grey.shade700),
        labelSmall: TextStyle(fontSize: 7.0, fontWeight: FontWeight.w600, color: Colors.grey.shade700),


      ),
    );
  }
}