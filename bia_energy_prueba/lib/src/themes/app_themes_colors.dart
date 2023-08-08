import 'package:flutter/material.dart';

class ThemeColor {
  static const Color white = Color(0xffffffff);
  static const Color secondaryGrey = Color(0xffF1F3F4);
  static const Color secondaryMediumGrey = Color(0xff0000004D);
  static const Color primaryBlack = Color(0xff0A1023);
  static const Color secondaryDarkBlue = Color(0xff221A7C);
  static const Color primaryDarkGrey = Color(0xff414141);
  static const Color primaryGreen = Color(0xff75FBFD);
  static const Color primaryGrey = Colors.grey;
  static const Color secondaryBlack = Color(0xff2B2F2C);
  static const Color secondaryRed = Color(0xffE2173A);
  static const Color primaryShadowGrey = Color(0xffBABABA);
  static const Color primaryYellow = Color(0xffE2B317);

  ThemeData get themeData {
    ColorScheme colorSchemeMovieApp = const ColorScheme(
      // primary green
      primary: Color(0xff0A1023),
      // primary blue
      primaryVariant: Color(0xff75FBFD),
      // gradient 1
      surface: Color(0xff221A7C),
      // gradient 2
      background: Color(0xffF1F3F4),
      // secondary grey
      //secondary: Color(0xffF1F3F4),
      secondary: Color(0xff2E2739),
      // secondary dark grey
      secondaryVariant: Color(0xff606260),
      // secondary red
      error: Color(0xffE2173A),
      // primary green
      onPrimary: Color(0xFFFFFFFF),
      // primary blue
      onSecondary: Color(0xff239DD1),
      // secondary grey
      onSurface: Color(0xff2E2739),
      // secondary dark grey
      onBackground: Color(0xff606260),
      // secondary red
      onError: Color(0xffE2173A),
      // white
      brightness: Brightness.light,
    );

    return ThemeData.from(colorScheme: colorSchemeMovieApp);
  }
}
