import 'dart:async';
import 'package:rutaz/features/home/data/repositories/route_repository_impl.dart';
import 'package:rutaz/features/home/domain/repositories/route_repository.dart';
import 'package:rutaz/features/home/domain/route_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'route_provider.g.dart';

/// Provider que inyecta el repositorio concreto (Dependency Injection)
/// Sigue la Regla de Oro #71: Riverpod Generators (@riverpod).
@riverpod
IRouteRepository routeRepository(Ref ref) {
  return RouteRepositoryImpl();
}

/// AsyncNotifier que maneja el estado de la lista de rutas disponible.
/// Sigue el Estándar de v2026: UI Reactiva e inmutable.
@riverpod
class RouteNotifier extends _$RouteNotifier {
  @override
  FutureOr<List<RouteModel>> build() async {
    final repo = ref.watch(routeRepositoryProvider);
    return await repo.getRoutes();
  }

  /// Método para actualizar favoritos desde la UI
  Future<void> toggleFavorite(String routeId) async {
    final repo = ref.read(routeRepositoryProvider);
    await repo.toggleFavorite(routeId);

    // Actualizar estado local inmutable
    state = AsyncValue.data(
      state.asData!.value.map((route) {
        if (route.id == routeId) {
          return route.copyWith(isFavorite: !route.isFavorite);
        }
        return route;
      }).toList(),
    );
  }
}
