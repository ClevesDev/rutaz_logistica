import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutaz/app.dart';

void main() {
  // Aseguramos que la aplicación siempre tenga acceso al estado global
  runApp(const ProviderScope(child: RutaZApp()));
}
