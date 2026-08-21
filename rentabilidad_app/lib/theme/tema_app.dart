import 'package:flutter/material.dart';

class TemaApp {
  static const Color colorPrincipal = Color(0xFFD97706); // Ámbar cálido
  static const Color colorFondo = Color(0xFFFDFBF7); // Blanco cálido marfil
  static const Color colorSuperficie = Color(0xFFFFFFFF);

  static ThemeData get temaClaro {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: colorFondo,
      colorScheme: ColorScheme.fromSeed(
        seedColor: colorPrincipal,
        surface: colorSuperficie,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: colorFondo,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Color(0xFF1E293B),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: colorPrincipal, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorPrincipal,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}