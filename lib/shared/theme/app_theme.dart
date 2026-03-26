import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kinyaana/shared/theme/app_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppMainColor.green4,
    ),

    scaffoldBackgroundColor: AppMainColor.base,

    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),

    textTheme: GoogleFonts.promptTextTheme(),
  );
}