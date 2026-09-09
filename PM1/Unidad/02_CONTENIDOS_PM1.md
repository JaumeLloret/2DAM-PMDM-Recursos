# Contenidos · Ecosistema móvil y Flutter actual

> Lectura objetivo: comprender decisiones. No memorices catálogos de herramientas.

## 1. Qué hace diferente al móvil

Una app móvil se ejecuta en un dispositivo con recursos, contexto de uso y ciclo de vida variables. La misma app puede arrancar con batería baja, poca memoria, pantalla pequeña, red intermitente y el sistema a punto de suspenderla.

### 1.1 Energía

CPU, GPU, red, pantalla, sensores y tareas en segundo plano consumen batería. Una decisión aparentemente inocente —actualizar sin pausa, mantener GPS activo o descargar datos repetidamente— tiene un coste que el usuario nota.

En PM1 no programaremos sensores ni segundo plano. Sí aprenderemos a preguntar:

- ¿la función necesita estar siempre activa?;
- ¿se puede trabajar por lotes?;
- ¿qué ocurre si el sistema pausa la app?;
- ¿el beneficio justifica el consumo?

### 1.2 CPU, memoria y almacenamiento

La oferta va desde terminales modestos a dispositivos muy potentes. Si una app presupone memoria ilimitada, puede cerrarse o responder mal en un perfil básico. El almacenamiento también puede estar casi lleno.

Una decisión profesional no es «optimizar todo»: es fijar perfiles de destino, medir después y degradar funciones de forma comprensible. La optimización sistemática pertenece a PM6.

### 1.3 Conectividad variable

Móvil significa cambios de Wi-Fi a datos, latencia, pérdida temporal y redes medidas. «Tengo conexión» no implica que una petición vaya a terminar.

En PM1 solo usamos este hecho como restricción. HTTP, autenticación, persistencia y tratamiento completo de errores pertenecen a PM4.

### 1.4 Pantalla, densidad y orientación

Dos pantallas con igual número de píxeles pueden tener tamaños físicos distintos. La **densidad** relaciona píxeles con tamaño físico; por eso las plataformas utilizan unidades lógicas. Formato, recorte, orientación, notch y áreas seguras afectan al resultado.

Aquí clasificaremos perfiles. La UI adaptable y su implementación pertenecen a PM3.

### 1.5 Tacto y contexto

Un dedo no tiene la precisión de un puntero. Los objetivos deben ser alcanzables, la información legible y el flujo tolerante a interrupciones. El usuario puede estar andando, tener una mano ocupada o usar ayudas de accesibilidad.

### 1.6 Ciclo de vida

El sistema puede enviar la app a segundo plano o terminar su proceso. «La cerré» y «el sistema liberó memoria» no son el mismo caso. Hoy solo identificamos la consecuencia: no confiar en que todo permanece vivo indefinidamente.

### 1.7 Capacidades y permisos

Cámara, micrófono, ubicación, Bluetooth o notificaciones no están siempre disponibles ni deben usarse sin explicar el propósito. PM5 enseñará su implementación. En PM1 basta con identificar si un perfil los necesita y qué alternativa tendría.

## 2. Familias tecnológicas

### 2.1 Nativo

Se utiliza el lenguaje, SDK y UI propios de cada plataforma: por ejemplo Kotlin/Jetpack Compose en Android o Swift/SwiftUI en plataformas Apple.

**Suele encajar cuando** se necesita acceso inmediato a capacidades nuevas, integración profunda, experiencia muy específica o un equipo separado por plataforma.

**Coste a considerar**: compartir intención no equivale a compartir toda la implementación; dos clientes pueden requerir habilidades, pruebas y mantenimiento diferentes.

### 2.2 Multiplataforma

Busca compartir una parte grande del código entre plataformas. No elimina las diferencias de Android/iOS: firma, permisos, publicación y determinadas integraciones siguen siendo específicas.

- Flutter comparte una base Dart y su framework de UI.
- React Native usa React/JavaScript y componentes que se conectan con UI nativa.
- Kotlin Multiplatform permite compartir lógica y elegir cuánto compartir de la interfaz.

No existe «mejor» sin contexto. Hay que preguntar cuánto acceso nativo, consistencia visual, reutilización, experiencia del equipo y mantenimiento exige el producto.

### 2.3 Web/PWA

Una aplicación web progresiva puede instalarse y ofrecer capacidades offline o integración limitada según navegador/plataforma. Es atractiva si alcance mediante URL y despliegue web pesan más que el acceso uniforme a APIs nativas.

No debe venderse como sustituto universal: soporte de capacidades, distribución y comportamiento dependen del navegador y sistema.

### 2.4 Matriz de decisión

Valora cada escenario con evidencia, no con lemas:

| Criterio | Pregunta |
|---|---|
| Acceso a plataforma | ¿necesitamos una API muy nueva o específica? |
| Rendimiento | ¿qué trabajo realiza la app y qué latencia tolera? |
| UI/experiencia | ¿debe parecer nativa de cada plataforma o coherente entre ellas? |
| Equipo | ¿qué lenguajes y ecosistemas puede mantener? |
| Reutilización | ¿qué parte es realmente común? |
| Despliegue | ¿qué tiendas, web o dispositivos son obligatorios? |
| Ciclo de vida | ¿cuánto costará actualizar y probar durante años? |

## 3. Flutter en el panorama

### 3.1 Qué es

Flutter es un framework de código abierto para aplicaciones multiplataforma compiladas. **Dart** es el lenguaje incluido en su SDK. El toolchain contiene el comando `flutter`, herramientas de compilación, depuración y paquetes necesarios para trabajar con los targets configurados.

Para PMDM elegimos Flutter porque ofrece una base común móvil, feedback rápido y un recorrido didáctico coherente. Eso no convierte Flutter en respuesta universal.

### 3.2 Modelo mental mínimo

```text
tu código Dart
    ↓
framework Flutter y árbol de widgets
    ↓
motor/renderizado + integración de plataforma
    ↓
Android, iOS u otro target soportado
```

Un **widget** describe una parte de la interfaz/configuración. En PM1 solo reconoceremos los que ya aparecen; PM3 enseñará UI, estado y arquitectura.

### 3.3 Hot reload, hot restart y ejecución nueva

- **Hot reload** inyecta cambios de código en una app en debug y reconstruye el árbol conservando normalmente el estado.
- **Hot restart** reinicia la parte Dart y pierde ese estado.
- **Ejecución nueva** recompila/arranca todo; algunos cambios de configuración o plataforma la exigen.

Si un cambio no aparece, guarda, mira errores y prueba hot restart antes de concluir que «Flutter no actualiza».

### 3.4 Límites

- un solo código no elimina pruebas por plataforma;
- una API nativa puede necesitar integración específica;
- iOS completo requiere macOS y Xcode;
- tamaño, consumo y rendimiento deben comprobarse, no suponerse;
- publicación y firma siguen reglas de cada plataforma.

## 4. Dispositivos, configuraciones y perfiles

### 4.1 Configuración

Una configuración clasifica un dispositivo por rasgos observables:

- versión/API del sistema;
- arquitectura;
- memoria y almacenamiento;
- tamaño, resolución, densidad y orientación;
- CPU/GPU;
- red disponible/medida;
- capacidades físicas;
- ayudas de accesibilidad.

### 4.2 Perfil dispositivo–aplicación

Un perfil no es «Pixel» o «móvil moderno». Es una hipótesis comprobable:

> La app de consulta de tareas debe funcionar en Android API 24 o posterior, 3 GB de RAM, pantalla compacta y red variable; la consulta principal seguirá siendo legible y mostrará una recomendación de modo ligero cuando el perfil sea restringido.

El perfil conecta:

1. usuarios y contexto;
2. requisito de app;
3. características mínimas/objetivo;
4. riesgo;
5. prueba o evidencia.

### 4.3 Emulador, simulador y dispositivo real

- Un **emulador** Android reproduce un dispositivo virtual y su sistema/arquitectura con herramientas de desarrollo.
- «Simulador» se usa de forma específica en el ecosistema Apple.
- Un dispositivo real descubre condiciones físicas, fabricantes, batería y red que un virtual no reproduce por completo.

El emulador ofrece repetibilidad y perfiles controlados; el real aporta fidelidad. Son complementarios.

## 5. Anatomía mínima del proyecto

| Ruta | Función en PM1 |
|---|---|
| [pubspec.yaml](../Alumnado/Starter/mobile_profile_lab/pubspec.yaml) | nombre, versión, restricción de SDK y dependencias |
| [lib/](../Alumnado/Starter/mobile_profile_lab/lib) | código Dart de la app |
| [lib/main.dart](../Alumnado/Starter/mobile_profile_lab/lib/main.dart) | punto de entrada con `main()` |
| [lib/mobile_profile.dart](../Alumnado/Starter/mobile_profile_lab/lib/mobile_profile.dart) | clase de datos del perfil |
| [lib/profile_screen.dart](../Alumnado/Starter/mobile_profile_lab/lib/profile_screen.dart) | pantalla que representa datos y decisión |
| [test/](../Alumnado/Starter/mobile_profile_lab/test) | comprobación mínima del comportamiento visible |
| `android/` | proyecto/configuración específica generada para Android |
| `.dart_tool/`, `build/` | artefactos generados; no se entregan |

El recorrido de nuestro starter es:

```text
main()
  → runApp(ProfileLabApp)
    → MaterialApp
      → ProfileScreen(profile)
        → buildDecisionText(profile)
```

## 6. Dart mínimo para leer el starter

No es el temario de PM2. Solo un diccionario:

```dart
final profile = MobileProfile(
  name: 'Perfil de laboratorio',
  memoryGb: 4,
  meteredNetwork: false,
);
```

- `final`: la referencia no se reasigna.
- `MobileProfile(...)`: crea un objeto de esa clase.
- `name:`: argumento con nombre.
- `'texto'`, `4`, `false`: String, entero y booleano.
- `if (...) { ... }`: elige una respuesta según una condición.
- `<=` significa menor o igual; `||` significa «o».

No necesitas dominar tipos, null safety, clases o colecciones todavía.

## 7. Toolchain y comandos de diagnóstico

Ejecuta desde terminal:

```bash
flutter --version
dart --version
flutter doctor -v
flutter doctor --android-licenses
flutter emulators
flutter devices
```

Después, dentro de cada starter:

```bash
flutter create . --platforms=android --org es.aulaflow.lab
flutter pub get
flutter analyze
flutter test
flutter run
```

`flutter create .` materializa la carpeta Android reproducible usando el SDK instalado. Hazlo en una **copia de trabajo**; conserva el starter original para comparar.

### Qué demuestra cada comando

| Comando | Pregunta que responde |
|---|---|
| `flutter --version` | ¿qué Flutter/Dart y canal estoy usando? |
| `flutter doctor -v` | ¿qué componente está bien o bloqueado? |
| `flutter emulators` | ¿qué AVD conoce el toolchain? |
| `flutter devices` | ¿qué targets están disponibles ahora? |
| `flutter analyze` | ¿hay problemas estáticos detectables? |
| `flutter test` | ¿se mantiene el comportamiento comprobado? |
| `flutter run -d ID` | ¿la app arranca en ese target? |

## 8. Diagnóstico por síntoma

| Síntoma | Comprueba primero | Acción acotada |
|---|---|---|
| `flutter: command not found` | ubicación SDK y `PATH` | añade `flutter/bin`, reabre terminal |
| Android toolchain con ✗ | salida exacta de `doctor -v` | instala componente concreto; no reinstales todo |
| licencias pendientes | mensaje de doctor | `flutter doctor --android-licenses` |
| lista de emuladores vacía | Device Manager e imagen instalada | crea AVD compatible |
| AVD muy lento/no inicia | virtualización y aceleración | habilita VT-x/AMD-V/KVM/hipervisor |
| `No devices found` | AVD encendido y `flutter devices` | inicia AVD, espera arranque completo |
| `pub get` falla | red, proxy, fecha/hora, mensaje | conserva salida y corrige una causa |
| cambio no visible | guardado/errores/tipo de cambio | hot reload; después hot restart |
| falta `android/` | materialización no realizada | ejecuta `flutter create . --platforms=android` |

## 9. Cierre conceptual

Una tecnología no se elige por moda. Se elige tras relacionar:

```text
necesidad de la app
  + perfil de usuarios/dispositivos
  + capacidades y límites
  + equipo y mantenimiento
  + evidencia de ejecución
= decisión técnica justificable
```

En PM1 harás esa relación sobre una app pequeña. Las unidades posteriores añadirán lenguaje, UI, arquitectura, datos, dispositivo y calidad cuando curricularmente corresponda.


