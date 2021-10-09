import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  AppThemes._();

  //constants color range for light theme
  static const Color _lightPrimaryColor = Color(0xffFFB517);
  static const Color _lightPrimaryVariantColor = Colors.white;
  static const Color _lightSecondaryColor = Colors.white;
  static const Color _lightOnPrimaryColor = const Color(0xe5707070);

  static const Color _lightButtonPrimaryColor = Color(0xffFFB517);
  static const Color _lightAppBarColor = Colors.orangeAccent;

  static const Color _lightIconColor = Color(0x80707070);
  static const Color _lightSnackBarBackgroundErrorColor = _lightPrimaryColor;

  //text theme for light theme

  static const  TextStyle _primaryTextTheme =
   TextStyle(color: _lightOnPrimaryColor);

  static const TextStyle _lightScreenHeadingTextStyle =
   TextStyle(fontSize: 20.0, color: _lightOnPrimaryColor);
  static const TextStyle _lightScreenTaskNameTextStyle =
   TextStyle(fontSize: 16.0, color: _lightOnPrimaryColor);
  static const TextStyle _lightScreenTaskDurationTextStyle =
   TextStyle(fontSize: 14.0, color: Colors.grey);
  static const TextStyle _lightScreenButtonTextStyle =  TextStyle(
      fontSize: 14.0, color: _lightOnPrimaryColor, fontWeight: FontWeight.w500);
  static const TextStyle _lightScreenCaptionTextStyle = TextStyle(
      fontSize: 12.0, color: _lightAppBarColor, fontWeight: FontWeight.w100);

  static final TextTheme _lightTextTheme = TextTheme(
    headline1: _lightScreenHeadingTextStyle,
    headline6: _primaryTextTheme.copyWith(
      fontSize: 20,
      letterSpacing: 1.04,
      fontWeight: FontWeight.w500,
    ),
    headline5: _primaryTextTheme.copyWith(
      fontSize: 24,
      letterSpacing: 1.14,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: _lightScreenTaskNameTextStyle,
    bodyText2: _lightScreenTaskDurationTextStyle,
    button: _lightScreenButtonTextStyle,
    subtitle2: _lightScreenTaskNameTextStyle,
    subtitle1: const TextStyle(
      fontSize: 13,
      color:  Color(0xff000000),
    ),
    caption: _lightScreenCaptionTextStyle,
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.montserrat().fontFamily,
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
        backgroundColor: _lightButtonPrimaryColor),
    appBarTheme: const AppBarTheme(
      color: _lightAppBarColor,
      iconTheme: IconThemeData(color: _lightOnPrimaryColor),
    ),

    primaryColor: _lightPrimaryColor,
    colorScheme: const ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightPrimaryVariantColor,
      secondary: _lightSecondaryColor,
      onPrimary: _lightOnPrimaryColor,
    ),
    snackBarTheme:
    const SnackBarThemeData(backgroundColor: _lightSnackBarBackgroundErrorColor),

    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    popupMenuTheme: const PopupMenuThemeData(color: _lightAppBarColor),
    textTheme: _lightTextTheme,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
        (states) => const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      )),
    ),
    buttonTheme: ButtonThemeData(
        buttonColor: _lightButtonPrimaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9))),
    elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle()),
    unselectedWidgetColor: _lightPrimaryColor,
    inputDecorationTheme: const InputDecorationTheme(
        fillColor: _lightPrimaryColor,
        labelStyle: TextStyle(
          color: _lightPrimaryColor,
        )),
  );
}
