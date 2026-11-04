# PM3 · Debugging guiado antes del laboratorio

Practicarás una reparación completa antes de trabajar sobre la entrega. El objetivo no es acertar rápido, sino aprender a reducir un fallo sin introducir otros.

## Estado seguro

1. Copia `Alumnado/Starter/aulaflow_flutter_ui_shell/` en una carpeta de trabajo.
2. Ejecuta `flutter pub get`, `flutter analyze` y `flutter test`.
3. Guarda el resultado inicial y duplica `lib/main.dart` como `lib/main.seguro.dart.txt` fuera del análisis Dart, o conserva otra copia de la carpeta.

No necesitas Git para esta práctica.

## Fallo reproducible · navegación desincronizada

En tu copia, localiza `locations` en `StarterShell`. Intercambia `/tasks` y `/board` SOLO en esa lista, sin cambiar las etiquetas de `NavigationBar`. Este fallo se introduce deliberadamente; el starter original no lo contiene.

### 1. Reproduce

Ejecuta a 390 px. Pulsa el segundo destino.

**Síntoma esperado:** la etiqueta pulsada y la pantalla abierta no representan el mismo destino.

### 2. Formula hipótesis

Antes de editar, completa:

> Creo que ocurre porque…

Escribe al menos dos hipótesis y elige cuál comprobarás primero.

### 3. Inspecciona

Localiza:

- lista de destinos visibles;
- lista de ubicaciones;
- `selectedIndex`;
- callback de selección.

Comprueba si existe más de una fuente para el mismo orden.

### 4. Aplica el cambio mínimo

Repara la relación entre destino y ruta sin reescribir toda la aplicación. Una solución válida usa una única descripción compartida o mantiene ambas listas explícitamente sincronizadas.

### 5. Verifica

```bash
flutter analyze
flutter test
flutter run
```

Recorre los tres destinos a 390 y 900 px. Deben coincidir icono, etiqueta, ruta, contenido e índice seleccionado.

### 6. Comprueba regresión

- redimensiona de compacto a ancho y vuelve;
- abre y cierra el detalle de una tarea;
- comprueba que la navegación inicial sigue funcionando (la adaptación se añadirá en el laboratorio);
- abre todos los destinos por teclado si tu destino lo permite.

## Vuelve al estado seguro

Si después de dos cambios no puedes explicar el síntoma, restaura la copia segura, reproduce otra vez y reduce el caso. No encadenes cambios no comprobados.

## Evidencia breve

Conserva:

1. síntoma observado;
2. hipótesis elegida;
3. fragmento o diff mínimo;
4. resultado antes/después;
5. comprobación de regresión;
6. regla aprendida en dos frases.

Cuando puedas narrar **síntoma → causa → cambio mínimo → verificación**, estás listo para aplicar el mismo método al laboratorio.
