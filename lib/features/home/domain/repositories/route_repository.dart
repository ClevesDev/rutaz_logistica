import 'package:rutaz/features/home/domain/route_model.dart';

/// Interfaz del repositorio de rutas (Capa Domain)
/// Sigue la Regla #37 de flutter-arquitectura.md: Dart puro y abstracto.
abstract class IRouteRepository {
  /// Obtiene la lista completa de rutas disponibles
  Future<List<RouteModel>> getRoutes();

  /// Marca una ruta como favorita de forma persistente
  Future<void> toggleFavorite(String routeId);
}
