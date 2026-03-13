import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rutaz/features/home/presentation/providers/route_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escuchando el estado asíncrono del provider
    final routesAsync = ref.watch(routeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('RutaZ: Logistics Dashboard'),
        actions: [
          IconButton(
            onPressed: () => ref.invalidate(routeProvider),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: routesAsync.when(
        data: (routes) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Rutas de Entrega Disponibles',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: routes.length,
                itemBuilder: (context, index) {
                  final route = routes[index];
                  return ListTile(
                    leading: const Icon(Icons.delivery_dining),
                    title: Text(route.name),
                    subtitle: Text('ID: ${route.id}'),
                    trailing: IconButton(
                      icon: Icon(
                        route.isFavorite ? Icons.star : Icons.star_border,
                        color: route.isFavorite ? Colors.amber : null,
                      ),
                      onPressed: () => ref
                          .read(routeProvider.notifier)
                          .toggleFavorite(route.id),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
