import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF22C55E)),
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      textTheme: GoogleFonts.interTextTheme(),
    );

    return base.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: false,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),
      cardTheme: const CardThemeData(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
      ),
    );
  }
}
