import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_model.freezed.dart';
part 'route_model.g.dart';

@freezed
abstract class RouteModel with _$RouteModel {
  // Uso de const para cumplir con el estándar de 60/120 FPS
  const factory RouteModel({
    required String id,
    required String name,
    @Default(false) bool isFavorite,
  }) = _RouteModel;

  factory RouteModel.fromJson(Map<String, dynamic> json) =>
      _$RouteModelFromJson(json);
}
