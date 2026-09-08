# Ejemplo guiado · Leer y ejecutar una app existente

Trabaja sobre una copia intacta de:

[Alumnado/Starter/mobile_profile_lab/](../Alumnado/Starter/mobile_profile_lab)

No implementes todavía la solución del laboratorio.

## 1. Predice antes de ejecutar

Abre [lib/main.dart](../Alumnado/Starter/mobile_profile_lab/lib/main.dart) y anota:

- nombre de la clase que se pasa a `runApp`;
- objeto `MobileProfile` que se crea;
- valores de `memoryGb` y `meteredNetwork`;
- pantalla que recibe ese objeto.

Abre [lib/profile_screen.dart](../Alumnado/Starter/mobile_profile_lab/lib/profile_screen.dart) y localiza:

- la clase `ProfileScreen`;
- el método `build`;
- la función `buildDecisionText`;
- el texto que aparecerá como recomendación.

**Predicción:** dibuja en el dossier una pantalla muy simple con el título, cuatro características y la recomendación.

## 2. Reconstruye el flujo

Completa sin copiar:

`main()` → __________ → `MaterialApp` → __________ → `buildDecisionText(__________)`

Después comprueba:

| Paso | Archivo | Clase/función | Responsabilidad observable |
|---:|---|---|---|
| 1 | `main.dart` | `main` | inicia la app |
| 2 | `main.dart` | `ProfileLabApp` | configura título/tema y entrega la pantalla |
| 3 | `mobile_profile.dart` | `MobileProfile` | conserva datos estáticos del perfil |
| 4 | `profile_screen.dart` | `ProfileScreen` | representa datos y recomendación |
| 5 | `profile_screen.dart` | `buildDecisionText` | devuelve la decisión visible |

`StatelessWidget` significa, para este ejemplo, que la pantalla se construye a partir de los datos recibidos. La gestión de estado se estudiará en PM3.

## 3. Prepara una copia ejecutable

Desde la raíz de tu copia:

```bash
flutter create . --platforms=android --org es.aulaflow.lab
flutter pub get
flutter analyze
flutter test
```

Resultado esperado:

- aparece `android/`;
- `pub get` termina sin error;
- analyzer no muestra incidencias;
- el test mínimo termina correctamente.

Si tu SDK modifica archivos de apoyo, no confundas los generados con los tres archivos Dart relevantes.

## 4. Arranca el emulador

1. Abre Device Manager.
2. Inicia el AVD asignado.
3. Espera hasta ver su escritorio.
4. Ejecuta:

```bash
flutter devices
flutter run -d <ID_DEL_EMULADOR>
```

El identificador debe proceder de `flutter devices`; no copies un ID de otra persona.

## 5. Resultado observable del starter

Debe aparecer:

- barra «Mobile Profile Lab»;
- nombre «Perfil de laboratorio»;
- API mínima 24;
- memoria 4 GB;
- red no medida;
- decisión «Pendiente de analizar».

Si la predicción no coincide, localiza el valor en el código. No modifiques todavía.

## 6. Hot reload de observación

Cambia **solo** el texto del nombre del perfil por «Mi copia PM1», guarda y pulsa `r` en la terminal de `flutter run`.

Comprueba:

- el texto cambia;
- la app no se reinicia desde cero;
- el resto continúa igual.

Deshaz ese cambio. Esta microprueba sirve para entender hot reload; no es la modificación evaluable.

## 7. Explicación mínima

Responde:

1. ¿Por qué el dato `memoryGb` vive en `MobileProfile` y se muestra en `ProfileScreen`?
2. ¿Qué ocurriría si cambias `meteredNetwork` a `true`?
3. ¿Por qué aún no cambia la recomendación?
4. ¿Qué archivo modificarías para convertir datos en decisión?

Checkpoint: enseña a un compañero o al docente el archivo exacto que respondería a la pregunta 4 y justifica tu elección en una frase.

## 8. Evidencia de ejemplo

Guarda en tu dossier:

- salida corta de `flutter --version`;
- nombre/ID del AVD;
- resultado de `flutter analyze` y `flutter test`;
- tu diagrama corregido;
- comparación predicción/resultado.

No pegues rutas personales completas ni cientos de líneas de consola.

