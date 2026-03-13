import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Servicio para manejo de datos sensibles usando AES/Keychain
/// Sigue la Regla de Oro #3: Nunca usar SharedPreferences para tokens.
class StorageService {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  /// Guarda un token de forma segura
  static Future<void> saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }

  /// Recupera el token de forma segura
  static Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }

  /// Elimina los datos almacenados (útil para Logout)
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
