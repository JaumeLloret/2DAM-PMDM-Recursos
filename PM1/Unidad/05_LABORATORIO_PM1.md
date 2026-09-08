# Laboratorio evaluable · Mobile Profile Lab

## Reto

El starter muestra datos de un perfil móvil, pero deja la decisión como «Pendiente de analizar». Debes convertir características del dispositivo en una recomendación visible, probar dos perfiles y demostrar el cambio en emulador.

No implementes navegación, estado, red, persistencia, sensores ni paquetes. Ese trabajo pertenece a unidades posteriores.

## Tiempo

- taller/itinerario equivalente: 55 min;
- cierre autónomo de evidencia: 25 min;
- total asignado dentro de PM1: 80 min.

## Punto de partida

[Alumnado/Starter/mobile_profile_lab/](../Alumnado/Starter/mobile_profile_lab)

Trabaja en una copia llamada `mobile_profile_lab_apellido_inicial`.

## Criterios de aceptación

1. El starter original arranca en un emulador Android.
2. `buildDecisionText` deja de devolver siempre «Pendiente».
3. Devuelve «Modo ligero recomendado» si `memoryGb <= 3` **o** `meteredNetwork` es `true`.
4. Devuelve «Modo completo viable» en el resto de casos.
5. Se demuestra un perfil restringido y otro no restringido.
6. La pantalla mantiene nombre, API, memoria y tipo de red.
7. `flutter analyze` y el test mínimo no muestran errores.
8. El alumno explica el recorrido y responde a un microcambio individual.

## Paso 1 · Baseline

```bash
flutter create . --platforms=android --org es.aulaflow.lab
flutter pub get
flutter analyze
flutter test
flutter run -d <ID_EMULADOR>
```

Registra versión, ID de AVD y resultado visible. Conserva evidencia «antes».

Checkpoint 1:

- [ ] veo «Pendiente de analizar»;
- [ ] puedo localizar de dónde sale;
- [ ] sé qué objeto llega a `ProfileScreen`.

## Paso 2 · Implementa la regla

Modifica solo `buildDecisionText` en [lib/profile_screen.dart](../Alumnado/Starter/mobile_profile_lab/lib/profile_screen.dart).

Pseudocódigo:

```text
si memoria <= 3 O red medida
    recomendar modo ligero
en otro caso
    indicar modo completo viable
```

Puedes consultar la sintaxis mínima en contenidos. No copies la solución reservada.

Checkpoint 2: con el perfil inicial (4 GB y red no medida) debe verse «Modo completo viable».

## Paso 3 · Prueba un perfil restringido

En [lib/main.dart](../Alumnado/Starter/mobile_profile_lab/lib/main.dart), cambia los datos a:

- nombre: `Perfil compacto`;
- memoria: 2 GB;
- red medida: sí;
- conserva API mínima 24.

Predice antes de recargar. Después ejecuta hot reload o hot restart y verifica «Modo ligero recomendado».

Checkpoint 3: explica qué parte es **dato** y qué parte es **regla**.

## Paso 4 · Variante individual

El docente asignará una:

| Variante | Datos | Resultado esperado |
|---|---|---|
| A | 3 GB, red no medida | ligero |
| B | 6 GB, red medida | ligero |
| C | 6 GB, red no medida | completo |
| D | 2 GB, red no medida | ligero |

Sin agente, modifica el perfil, predice y demuestra. El docente puede cambiar uno de los valores durante la verificación.

## Paso 5 · Verifica

```bash
flutter analyze
flutter test
flutter run -d <ID_EMULADOR>
```

Guarda solo la parte relevante de la salida. Si un comando falla:

1. no escribas «OK»;
2. registra fallo exacto;
3. separa problema de código, toolchain o dispositivo;
4. aplica una corrección;
5. vuelve a ejecutar el comando.

## Paso 6 · Diff y explicación

Si usas Git:

```bash
git diff -- lib/main.dart lib/profile_screen.dart
```

Si no usas Git, copia los dos fragmentos antes/después e indica archivo y función.

Explica en 120–180 palabras:

- qué cambió;
- por qué cumple la regla;
- qué perfil lo demuestra;
- qué no demuestra todavía;
- por qué emulador y dispositivo real son complementarios.

## Evidencia de emulador

Incluye:

- nombre/ID del AVD y API;
- `flutter devices` con el target Android;
- captura antes/después o vídeo breve según indique el docente;
- terminal/app visibles sin datos personales;
- explicación individual.

Una captura aislada no acredita RA1.h: debe triangularse con ejecución y explicación.

## Paquete de entrega

Incluye:

```text
DOSSIER_PM1.md
mobile_profile_lab_apellido_inicial/
  lib/
  test/
  pubspec.yaml
  analysis_options.yaml
```

Excluye:

```text
.dart_tool/
build/
.idea/
rutas o credenciales personales
```

## Si no puedes emular en tu equipo

Registra el bloqueo y utiliza, por este orden:

1. corregir virtualización/aceleración;
2. equipo de aula preparado;
3. tutoría individual en equipo capaz de emular.

Web o dispositivo físico pueden aportar evidencia adicional, pero el CE h seguirá pendiente hasta la ejecución real en emulador.


