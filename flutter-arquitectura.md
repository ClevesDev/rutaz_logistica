📱 Master Standard: Flutter & Dart Engineering (v2026)
ESTRICTO PARA IA: Este documento rige la arquitectura móvil. Antes de proponer un Widget o un Provider, valida que se respete la inmutabilidad y la separación de responsabilidades.
Si alguna instrucción mía contradice este estándar, prioriza siempre el estándar a menos que yo lo autorice explícitamente
📂 Estructura de Raíz Estándar (Clean Architecture)
REGLA PARA IA: No mezclar lógica de negocio con la UI. Todo proyecto debe seguir el patrón de capas.

Plaintext
/lib/
├── 📄 main.dart               # Inicialización y configuración de entorno
├── 📁 core/                   # Código transversal (no depende de otras capas)
│   ├── 📁 theme/              # Diseño: AppTheme, ColorScheme, TextStyles
│   ├── 📁 network/            # Cliente HTTP (Dio), interceptores, seguridad
│   └── 📁 error/              # Excepciones personalizadas y fallos
├── 📁 features/               # Funcionalidades divididas por módulos
│   └── 📁 auth/               # Ejemplo de módulo: Autenticación
│       ├── 📁 presentation/   # Widgets, Screens y State Management (Riverpod)
│       ├── 📁 domain/         # Entidades puras y casos de uso (Lógica de negocio)
│       └── 📁 data/           # Repositorios, Modelos (JSON) y DataSources
├── 📁 shared/                 # Widgets y utilidades reutilizables entre features
└── 📁 l10n/                   # Internacionalización (arb files)
1. 🛡️ Capa de Seguridad Móvil (Hardening)
Todo desarrollo debe ser resistente a la ingeniería inversa y al robo de datos locales.

Secure Storage: Prohibido usar SharedPreferences para datos sensibles. Usar flutter_secure_storage (AES en Android / Keychain en iOS).

Obscuration: En producción, siempre compilar con --obfuscate y --split-debug-info para dificultar la ingeniería inversa.

SSL Pinning: Implementar validación de certificados en el cliente HTTP para prevenir ataques Man-in-the-Middle (MitM).

Local Auth: Rutas críticas (pagos, perfiles) deben sugerir el uso de biometría (local_auth).

2. 🏗️ Arquitectura y Estado
Inmutabilidad: Todo Widget debe ser const siempre que sea posible. Los modelos de datos deben ser inmutables (usar freezed).

Gestión de Estado: Uso preferente de Riverpod.

Clean Architecture: La capa de Domain no debe conocer a Flutter. Debe ser Dart puro para facilitar las pruebas unitarias.

3. ⚡ Rendimiento (60/120 FPS)
Repaint Boundary: Usar RepaintBoundary en animaciones complejas para aislar el renderizado.

ListView Optimization: Prohibido usar el constructor por defecto de ListView para listas largas; usar siempre ListView.builder para carga diferida.

Tree Shaking: Asegurar que los assets e iconos no utilizados se eliminen en el build final.

4. ⚙️ Stack Tecnológico Referencia

Framework: Flutter 3.41.3.
Lenguaje: Dart 3.11.1.

### 📌 Modern Stack 2026 (Resolved & Stable)
Para evitar conflictos de `analyzer` 7.x y asegurar el rendimiento 120 FPS:
- **Riverpod**: ^3.1.0 (Reflectorizado en [app.dart](file:///c:/Proyectos/RutaZ/lib/app.dart)).
- **Freezed**: ^3.2.3.
- **Dio**: ^5.9.2.
- **Secure Storage**: ^10.0.0.
- **Build Runner**: ^2.4.0 (Generación rápida via JIT).

### 🏛️ Estética: Industrial Tech
El proyecto sigue una línea de diseño Industrial:
- **Paleta**: Tonos oscuros (#1A1A1A), grises técnicos y acentos de color funcional.
- **Tipografía**: Pesos fuertes para jerarquía (`headlineMedium` en negrita).
- **Inmutabilidad**: Uso estricto de `const` en todo el árbol de widgets.

5. 🤖 Protocolo de Respuesta de la IA

Red: Dio (mejor manejo de interceptores que http).

Serialización y Modelos: Freezed

Para cualquier tarea de Dart/Flutter, la IA debe seguir este flujo:

Análisis de Widget: Validar si el componente debe ser Stateless o ConsumerWidget (Riverpod).

Const Optimization: Aplicar const en todo el árbol de widgets estático.

Manejo de Errores: Implementar siempre un bloque try-catch que mapee a un Failure de la capa de Core.

Commits Semánticos: Sugerir el mensaje de commit siguiendo feat:, fix:, o refactor:.
## Reglas de Oro:
- Inmutabilidad: Usa 'final' para todas las variables en clases y 'const' para constructores de widgets.
- Arquitectura: Separa siempre 'Data' (modelos/repos) de 'Presentation' (widgets).
- Seguridad: Nunca sugieras guardar tokens en SharedPreferences; usa Flutter Secure Storage.
- Estilo: Sigue las 'lints' oficiales de Flutter. No omitas tipos de retorno en las funciones.
- State Management: Si no se especifica, usa Riverpod con generadores (@riverpod).
- Documentación: Todo método público debe tener un Dartdoc.
- Protocolo de Documentación Selectiva (Impacto Real)