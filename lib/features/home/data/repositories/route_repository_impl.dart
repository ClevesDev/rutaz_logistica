import 'package:flutter/foundation.dart';
import 'package:rutaz/features/home/domain/repositories/route_repository.dart';
import 'package:rutaz/features/home/domain/route_model.dart';

/// Implementación concreta del repositorio de rutas (Capa Data)
/// Sigue la Regla #18: Datos separada de Presentation.
class RouteRepositoryImpl implements IRouteRepository {
  // Lista en memoria como ejemplo; aquí iría la llamada a DataSources (JSON/API)
  final _routes = [
    const RouteModel(id: '1', name: 'Ruta Industrial A'),
    const RouteModel(id: '2', name: 'Ruta Logística Central'),
    const RouteModel(id: '3', name: 'Zona de Distribución Norte'),
  ];

  @override
  Future<List<RouteModel>> getRoutes() async {
    // Simula una latencia de red (Regla de Oro #4: 120 FPS mindset)
    await Future.delayed(const Duration(milliseconds: 500));
    return _routes;
  }

  @override
  Future<void> toggleFavorite(String routeId) async {
    // Implementar lógica de persistencia si fuera necesario
    debugPrint('Persistiendo favorito: $routeId');
  }
}
