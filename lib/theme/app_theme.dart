import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Vibrant Color Palette
  static const Color primaryColor = Color(0xFF6C63FF); // Periwinkle / Purple
  static const Color accentColor = Color(0xFFFF6584); // Pinkish Red
  static const Color backgroundColor = Color(0xFFF8F9FE); // Light Blue-Grey
  static const Color cardColor = Colors.white;
  static const Color textColor = Color(0xFF2D3142); // Dark Blue-Grey
  static const Color secondaryTextColor = Color(0xFF9C9EAE); // Grey

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        background: backgroundColor,
        surface: cardColor,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.outfit(
          color: textColor,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: GoogleFonts.outfit(
          color: textColor,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.inter(
          color: textColor,
          fontSize: 22, // Size for quotes
          height: 1.5,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: GoogleFonts.inter(
          color: secondaryTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: GoogleFonts.outfit(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 4,
          shadowColor: primaryColor.withOpacity(0.4),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(foregroundColor: textColor),
      ),
    );
  }
}
