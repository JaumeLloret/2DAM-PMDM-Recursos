# PM3 · Ruta de aprendizaje

> Fuente anterior conservada para trazabilidad. La publicación vigente se define en el manifiesto AULES v3 y usa los libros integrados 13–16; este documento no se exporta como una actividad separada.


## Qué vas a conseguir

En PM3 vas a transformar un prototipo Flutter que funciona solo en un caso sencillo en una interfaz que sigue siendo comprensible cuando cambia el espacio, permite navegar por varios destinos y mantiene una única fuente de verdad para el estado.

Al terminar podrás:

- construir pantallas, menús, alertas y controles Material con una finalidad clara;
- explicar por qué una UI se desborda y corregirla desde sus `constraints`;
- alternar `NavigationBar` y `NavigationRail` según el espacio disponible;
- navegar a un detalle mediante un id estable;
- distinguir estado local de estado de feature;
- separar View, ViewModel y un repositorio local sin crear capas ceremoniales;
- comprobar la app en vista compacta, ancha, texto ampliado y teclado;
- diagnosticar un fallo pequeño antes de entregar.

No usarás red, autenticación, persistencia, sensores ni multimedia. `AulaFlow Flutter UI Shell` es un caso didáctico local con datos `DEMO-*`; no fija la arquitectura de AulaFlow 2.0.

## Antes de empezar · prepara el entorno

PM1 ya presentó Flutter. Aquí no repetimos toda la instalación, pero sí comprobamos que el entorno que vas a usar es reproducible.

### Editor recomendado

- **VS Code + extensiones Flutter y Dart** es la opción recomendada para editar y ejecutar el proyecto con una interfaz ligera.
- **Android Studio + plugins Flutter y Dart** también es válido como IDE.
- Aunque edites con VS Code, utiliza **Android Studio** para instalar componentes Android desde **SDK Manager** y crear/iniciar emuladores desde **Device Manager**.

Abre siempre la **carpeta que contiene `pubspec.yaml`**. No abras únicamente `lib/main.dart`: el editor necesita reconocer el paquete completo.

### Checkpoint de herramientas

Abre una terminal y ejecuta:

```bash
flutter --version
dart --version
flutter doctor -v
flutter devices
```

Debes ver las versiones de Flutter/Dart y al menos un destino utilizable. `flutter doctor -v` puede mostrar avisos de plataformas que no usarás; céntrate en Flutter y en el destino elegido.

Si `flutter` no se reconoce, no reinstales todo: ve a **Ayuda PM3**, comprueba PATH y conserva el mensaje exacto.

### Si necesitas un emulador Android

1. Abre Android Studio.
2. En la pantalla inicial usa **More Actions → SDK Manager** y confirma que hay un Android SDK instalado.
3. Abre **More Actions → Virtual Device Manager** o, dentro de un proyecto, **Tools → Device Manager**.
4. Crea un dispositivo virtual si no existe, inicia el AVD y espera a ver su pantalla de inicio.
5. Ejecuta `flutter devices`; el emulador debe aparecer en la lista.

Un AVD es una máquina Android virtual. Necesita virtualización activada y suficiente memoria. Si no arranca, puedes avanzar temporalmente con Chrome o una ventana de escritorio, pero necesitarás una ejecución real en un destino válido para cerrar la evidencia que te corresponda.

### Abre y ejecuta el starter

Localiza:

```text
30 - PMDM/Unidades/PM3/Alumnado/Starter/aulaflow_flutter_ui_shell/
```

Ábrela como carpeta de proyecto y ejecuta desde esa misma carpeta:

```bash
flutter create . --platforms=android --project-name aulaflow_flutter_ui_shell_starter
flutter pub get
flutter analyze
flutter test
flutter run
```

`flutter create` materializa la plataforma Android que el paquete fuente no versiona. No borra `lib/main.dart`. Si ya existe `android/`, omite ese comando.

### Primera microvictoria

La app debe abrir con el título **AulaFlow UI starter**, tres destinos y tareas `DEMO-*`. Cambia de Tareas a Tablero y Ajustes. Si lo ves, el punto de partida funciona; todavía no has resuelto las deudas intencionales.

## Cómo probar 390 px, 900 px y texto ampliado

### Ancho lógico

Opción rápida con Chrome:

1. si tu proyecto aún no tiene carpeta `web`, ejecuta `flutter create . --platforms=web` desde su carpeta principal; después ejecuta `flutter run -d chrome`;
2. abre las herramientas de desarrollo del navegador;
3. activa la barra de dispositivos o modo adaptable;
4. introduce `390 × 800` y después `900 × 700`;
5. recarga solo si el cambio no se refleja y anota qué navegación aparece.

Opción con escritorio: redimensiona la ventana y muestra temporalmente `MediaQuery.sizeOf(context).width` durante el diagnóstico. Retira ese texto antes de entregar.

Los valores son **píxeles lógicos**, no píxeles físicos de la pantalla.

### Texto ampliado

En un emulador Android abre **Ajustes → Accesibilidad → Tamaño de visualización y texto → Tamaño de fuente** y selecciona un nivel grande. Vuelve a la app y comprueba que acciones y etiquetas continúan disponibles. Registra el nivel utilizado; no afirmes «200 %» si la herramienta no muestra ese valor exacto.

## Ruta completa · 720 minutos

Todo el trabajo obligatorio está incluido. En los pasos 4 y 10 eliges **taller opcional** o **misión autónoma equivalente**; ambas duran 45 minutos efectivos y persiguen el mismo checkpoint.

| Paso | Tiempo | Lee o consulta | Haz | Comprueba | Conserva o entrega |
|---:|---:|---|---|---|---|
| 1 | 30 min | Esta ruta y diagnóstico Q01–Q04 | Comprueba herramientas, abre el starter y predice 390/900 | La app abre y sabes tu estado verde/ámbar/rojo | Resultado o bloqueo exacto |
| 2 | 80 min | Teoría §1–3 y ejemplos E1/E3 | Trabaja K1–K2 y K4–K5 | Corriges un overflow y explicas widget, evento y feedback | Cuaderno y copia de trabajo |
| 3 | 75 min | Teoría §4–5 y ejemplo E2 | Trabaja K3 y prueba compacto/ancho/texto grande | Bar/rail cambian por espacio sin perder acciones | Registro de tamaños y decisión |
| 4 | 45 min | Talleres opcionales · misión 1 | Asiste o realiza la misión autónoma de layout adaptable | Predicción, cambio mínimo y comprobación coinciden | Evidencia de la misión 1 |
| 5 | 90 min | Teoría §6 y E5 | Trabaja K6–K7 y navega por id | Id válido abre detalle; id inválido no bloquea la app | Mapa de rutas |
| 6 | 100 min | Teoría §7–8 y E4/E8 | Trabaja K8–K10 y separa estado de feature | Filtro/orden sobreviven donde deben y vacío no es error | Tabla de estado y pruebas |
| 7 | 75 min | Teoría §9 y E7 | Trabaja K11–K12 e inicia el laboratorio | ViewModel recibe `TaskRepository`; no existe Service vacío | Mapa de dependencias |
| 8 | 110 min | Laboratorio por hitos | Completa el producto mínimo y una práctica de debugging | Cada hito deja una app ejecutable o un rescate conocido | Proyecto y evidencias I2 |
| 9 | 70 min | Evaluación, ayuda y autoevaluación | Comprueba entrega y prepara microvariación | Analyze/test y checklist reflejan el estado real | ZIP/proyecto + decisiones + registro |
| 10 | 45 min | Talleres opcionales · misión 2 | Taller o vía autónoma: debugging, I3 y explicación | Produces y explicas una variación propia sin agente | Evidencia I3 y cierre |
|  | **720 min** |  |  |  |  |

## Cómo trabajar las prácticas

Usa siempre esta secuencia:

1. **Lee** el estado inicial y localiza el fichero.
2. **Predice** el resultado o error.
3. **Ejecuta** antes de cambiar nada.
4. **Modifica** una sola causa.
5. **Verifica** el resultado y una regresión cercana.
6. **Explica** qué relación causal has comprobado.

## Talleres y ausencia

- 20/10/2026 · 19:30–20:25: layout y navegación adaptable.
- 27/10/2026 · 19:30–20:25: debugging, microvariación y feedback.

La asistencia no desbloquea contenido ni evidencia exclusiva. Consulta **Talleres opcionales PM3** y realiza la misión autónoma correspondiente si no asistes. I3 conserva el mismo tipo de variación, predicción, ejecución y explicación por ambas vías.

## Fechas de la tarea de entrega PM3

- Apertura: `18/10/2026 00:00`.
- Entrega recomendada: `01/11/2026 23:59`.
- Cierre de recepción: `02/11/2026 23:59`.

La entrega recomendada permite recibir la primera revisión. Puedes enviar hasta el cierre del 02/11/2026 a las 23:59; después necesitarás acordar la recuperación del foco pendiente. PM4 comienza el 03/11/2026. Las fechas se repiten en la tarea de entrega.

La franja de taller 19:30–20:25 tiene 55 min nominales, 45 efectivos y 10 de margen. Los 20 min trasladados se encuentran en los pasos 5 y 9; no son una actividad adicional.

## Qué entregarás

1. proyecto Flutter ejecutable, sin `build/`, `.env`, secretos ni datos reales;
2. plantilla de decisiones;
3. checklist y registro reproducible;
4. evidencias compacta/ancha y accesibilidad básica;
5. microvariación I3 individual sin agente.

La fecha y el canal definitivos aparecerán en la tarea de AULES. No inventes un límite de ZIP: sigue el que muestre la tarea cuando se publique.

## Si te bloqueas

Conserva: paso, sistema, editor, comando, primer mensaje de error, fichero/línea, resultado esperado y una o dos acciones ya probadas. Consulta **Ayuda PM3**. No compartas tokens, cuentas, números de serie, rutas personales completas ni datos de otras personas.
