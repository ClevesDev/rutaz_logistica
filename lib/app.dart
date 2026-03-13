import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutaz/core/theme/app_theme.dart';
import 'package:rutaz/features/home/presentation/screens/home_screen.dart';

class RutaZApp extends ConsumerWidget {
  const RutaZApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'RutaZ',
      debugShowCheckedModeBanner: false,
      theme: AppTheme
          .darkTheme, // Usamos el tema oscuro Industrial Tech por defecto
      home: const HomeScreen(),
    );
  }
}
