# RutaZ - Delivery & Logística

Proyecto de ingeniería avanzada para servicios de delivery y logística, construido bajo los estándares de **Clean Architecture (v2026)**.

## 🚀 Estado: Engineering Ready
Este proyecto ha sido configurado para maximizar el rendimiento (60/120 FPS) y la seguridad móvil.

### 🏗️ Arquitectura
- **Core**: Lógica transversal, seguridad (Secure Storage) y red (Dio).
- **Features**: Módulos independientes con capas de Presentation, Domain y Data.
- **Shared**: Componentes y utilidades reutilizables.

### 🛡️ Seguridad y Tecnología
- **State Management**: Riverpod (Generators).
- **Inmutabilidad**: Freezed Modelos.
- **Seguridad**: AES/Keychain vía Flutter Secure Storage.
- **Network**: Dio con interceptores avanzados.

## ⚙️ Desarrollo
Para regenerar los modelos y providers, ejecute:
```bash
dart run build_runner build --delete-conflicting-outputs
```
