import 'package:flutter/material.dart';

/// Configuración global de diseño siguiendo el estilo "Industrial Tech"
class AppTheme {
  // Constructor privado para evitar instanciación
  AppTheme._();

  static final ColorScheme _colorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF1A1A1A), // Tono oscuro industrial
    brightness: Brightness.dark,
  );

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme,
      scaffoldBackgroundColor: _colorScheme.surface,
      // Aplicación de const para optimización de renderizado
      appBarTheme: const AppBarTheme(centerTitle: false, elevation: 0),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
      ),
    );
  }
}
