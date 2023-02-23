import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class AppTheme {
  static const horizontalMargin = 16.0;
  static const radius = 10.0;

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.scaffoldBackground,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AppColor.accentColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColor.accentColor,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(
        color: AppColor.primaryText,
      ),
      titleTextStyle: GoogleFonts.poppins(
        color: AppColor.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: GoogleFonts.poppins(
        color: AppColor.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.scaffoldBackground,
      unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
      selectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
      unselectedItemColor: const Color(0xffA2A5B9),
      selectedItemColor: AppColor.accentColor,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AppColor.accentColor,
      unselectedLabelColor: AppColor.secondaryText,
    ),
  );
}
