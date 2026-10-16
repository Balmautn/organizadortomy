# Mi Organizador

Aplicación personal multiplataforma en Flutter. La base inicial incluye calendario de 2026, alta de actividades, categorías, horarios, notas descriptivas por actividad y almacenamiento local SQLite. No requiere cuenta.

## Plataformas y entregables

- **Android:** GitHub Actions genera `app-release.apk`.
- **Windows:** genera los archivos de la aplicación de escritorio; descargá el artefacto completo, no solo el `.exe`.
- **macOS:** genera el `.app` dentro del artefacto; para distribuirlo fuera de tu Mac normalmente se requiere firma/notarización.
- **iOS:** el workflow compila una app sin firma. Esto sirve como verificación de compilación, pero **no** produce una app instalable en un iPhone. La instalación/distribución requiere firma de Apple, certificados/perfiles y normalmente una cuenta Apple Developer, por ejemplo usando TestFlight.

## Cómo subirlo a GitHub desde el celular

1. Descargá y descomprimí `mi_organizador_multiplataforma.zip`.
2. En GitHub, creá un repositorio nuevo llamado `mi-organizador`. Podés elegirlo privado.
3. Subí el contenido de esta carpeta a la raíz del repositorio. Debe quedar `pubspec.yaml`, `lib/`, `.github/` y `test/` en la raíz.
4. Abrí la pestaña **Actions** del repositorio. Si GitHub solicita habilitar workflows, aceptá.
5. Ejecutá manualmente los workflows **Build Android APK**, **Build Windows and macOS** y **Build iOS (unsigned)** desde **Run workflow**, o hacé un push a `main`.
6. Cuando termine cada ejecución, abrí la ejecución y descargá el archivo de la sección **Artifacts**.

## Si subís archivos desde la web móvil

GitHub web permite cargar archivos, pero subir carpetas completas desde un teléfono puede ser incómodo. Si no podés cargar el ZIP como estructura de repositorio, usá GitHub Codespaces desde el navegador (si está disponible para tu cuenta) o un entorno cloud de desarrollo.

## Compilar localmente (opcional)

Con Flutter estable instalado:
```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

Para APK:
```bash
flutter build apk --release
```

## Limitaciones conocidas de esta primera entrega

Esta es una **base inicial**, no una aplicación terminada con todas las funciones solicitadas. Las alarmas/notificaciones, rutinas recurrentes, interfaz de finanzas y notas independientes, exportación/importación, sincronización y feriados argentinos aún deben implementarse. La base de datos tiene tablas iniciales para notas, gastos y subtareas, pero todavía no tienen pantallas completas.

La persistencia SQLite con `sqflite` está orientada principalmente a Android/iOS. La compilación de Windows/macOS puede requerir cambiar el adaptador de base de datos por una solución compatible con escritorio (por ejemplo Drift con `sqlite3`/`sqlite3_flutter_libs`) antes de habilitar almacenamiento local en esas plataformas. Los workflows permiten detectar esos problemas, no garantizan que todos los targets compilen en este primer estado.

## Seguridad

No subas certificados de firma, claves privadas, contraseñas ni archivos `.env` con secretos al repositorio. Configurá secretos de GitHub únicamente cuando llegue el momento de firmar las versiones de distribución.
