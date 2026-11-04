# Pantallas adaptables: aprende y practica

## De widgets a una pantalla que puedes explicar

Ya has abierto AulaFlow y respondido al diagnóstico. Ahora practica en un proyecto pequeño antes de cambiar tu aplicación. Descarga **Ejemplos UI adaptable** en la descripción de este libro, descomprime y abre la carpeta del proyecto. Conserva AulaFlow aparte: son dos proyectos distintos.

Ejecuta `flutter pub get`, `flutter analyze`, `flutter test` y `flutter run` en la terminal del proyecto de ejemplos. Debes ver un contador y tres destinos. Este ejemplo ya cambia entre navegación inferior y lateral; vas a comprenderlo y modificarlo, no a escribirlo desde cero.

Un **widget** describe una parte de la interfaz. Un `Text` describe texto; un `Column`, cómo colocar hijos verticalmente; un `Scaffold`, la estructura habitual de una pantalla Material. Flutter combina esas descripciones en un árbol. El árbol importa porque el padre ofrece espacio y servicios a sus descendientes.

{{DIAGRAM_WIDGETS}}

Localiza `Scaffold`, `LayoutBuilder`, `Row` y `Expanded` en el archivo principal del proyecto de ejemplos. No memorices el árbol entero. Sigue una sola rama desde el `Scaffold` hasta el texto del contador.

`BuildContext` indica dónde está un widget en ese árbol. No es una bolsa de datos global. Cuando escribes `ScaffoldMessenger.of(context)`, Flutter busca el servicio correspondiente a partir de esa posición. `MaterialApp` proporciona un `ScaffoldMessenger` raíz por defecto. Un contexto de fuera del ámbito apropiado no puede encontrar un ancestro que no tiene.

**Prueba pequeña · K1.** Cambia el texto que acompaña al contador, ejecuta y comprueba que solo cambia esa etiqueta. Después dibuja cuatro cajas con los widgets que la contienen. Guarda el dibujo en tu cuaderno. Si cambiaste el lugar equivocado, busca el texto literal mostrado en pantalla y deshaz únicamente tu último cambio.

**Comprueba tu comprensión:** ¿por qué cambiar un `Text` no cambia automáticamente la distribución de sus hermanos? Porque el padre sigue decidiendo cómo les reparte el espacio. En el siguiente capítulo vas a provocar un problema de espacio de forma controlada.

## El espacio disponible: reproduce y repara un desbordamiento

Un padre comunica a su hijo unos límites de tamaño, llamados **constraints**. El hijo elige un tamaño dentro de esos límites. Después el padre lo coloca. Un número fijo grande no crea espacio nuevo: puede producir un desbordamiento, el aviso amarillo y negro que Flutter llama *overflow*.

{{DIAGRAM_CONSTRAINTS}}

**Ejemplo trabajado · E1.** Haz una copia de seguridad del proyecto de ejemplos. En su `Column`, sustituye temporalmente SOLO el widget `Text` del contador por este fragmento. Es un fallo que introduces para aprender; el ZIP original no contiene este `Row` defectuoso.

```dart
Row(
  children: const [
    Icon(Icons.info_outline),
    Text('Una descripción larga que no cabe en una pantalla estrecha'),
  ],
)
```

A 390 px, el `Row` intenta colocar el texto con el ancho que este pide. Sus hijos no negocian por sí solos el espacio restante. Predice qué se saldrá antes de ejecutar. Ahora limita el texto al espacio que queda:

```dart
Row(
  children: const [
    Icon(Icons.info_outline),
    SizedBox(width: 8),
    Expanded(
      child: Text(
        'Una descripción larga que no cabe en una pantalla estrecha',
      ),
    ),
  ],
)
```

`Expanded` entrega al texto la parte disponible del eje horizontal; el texto puede ocupar varias líneas. No arreglas el problema escondiendo el aviso ni reduciendo la letra hasta que no se lea.

**Practica · K2.** Prueba el fragmento corregido a 390 y 900 px. Aumenta el texto del sistema o del navegador. Debes conservar el icono y la frase completa sin recorte ni overflow. Guarda una captura antes y otra después, con el ancho usado. Explica qué padre limita a qué hijo. Finalmente restaura el contador: el fallo deliberado no debe pasar a AulaFlow.

Si sigue fallando, comprueba que `Expanded` es hijo directo del `Row` mostrado y que no has añadido un ancho fijo alrededor. No añadas varios `Expanded` al azar: vuelve al último estado que funcionaba y cambia una sola restricción.

## Los mismos destinos: barra inferior o barra lateral

Una interfaz **responsive** redistribuye el contenido según el espacio. Una interfaz **adaptive** elige una representación adecuada: por ejemplo, barra inferior cuando hay poco ancho y barra lateral cuando hay más. No son dos aplicaciones distintas.

En el ejemplo, `LayoutBuilder` entrega las constraints de la zona en la que se construye la pantalla. La condición de 600 px decide qué navegación mostrar. A 390 verás `NavigationBar`; a 900, `NavigationRail`. La lista de destinos y el índice seleccionado son compartidos. Así el segundo destino no se convierte en otro al ensanchar la ventana.

{{DIAGRAM_ADAPTIVE}}

**Ejemplo trabajado · E2.** Lee la condición de ancho y las dos ramas del ejemplo. Pulsa el segundo destino a 390 y ensancha a 900. Predice primero cuál quedará seleccionado. Debe seguir siendo el segundo: cambia la representación, no la decisión del usuario.

**Practica · K3.** Cambia temporalmente el umbral de 600 a 720. Comprueba 719 y 720, además de 390 y 900. Anota cuatro resultados. Devuélvelo después a 600. No tienes que implementar una adaptación que ya existe; tienes que demostrar dónde se decide y qué conserva.

Cuando lo apliques a AulaFlow, usa una única lista para etiquetas, iconos y rutas. Dos listas independientes pueden divergir. Un ancho grande no exige una ruta nueva ni una segunda copia del estado.

Guarda la condición original y tu tabla de pruebas. Si cambia la selección al redimensionar, revisa dónde creas el índice seleccionado: no debe reinicializarse dentro de `build`. El siguiente capítulo explica precisamente qué estado puede quedarse en una vista.

## Controles, estado local y una acción comprensible

El contador del ejemplo tiene una interacción pequeña: pulsas un botón, cambia un número y la vista se vuelve a construir. Su valor pertenece a esa demostración. `setState` comunica a Flutter que debe reconstruir la vista; no guarda datos en disco ni sincroniza otras pantallas.

**Ejemplo trabajado · E3.** Localiza `_count` y el callback del botón. Predice qué expresión cambia el número y qué llamada permite ver el nuevo valor. Pulsa dos veces: debes observar dos incrementos, no una modificación de una lista de tareas.

El estado de un diálogo abierto o una pestaña temporal también puede ser local. El estado de tareas que necesita lista, tablero y detalle es diferente: lo compartirás en el siguiente libro. No conviertas todos los valores en globales ni prohíbas `setState` sin considerar quién necesita el dato.

**Practica · K4.** El ejemplo usa un botón con icono Y texto. Cambia su etiqueta por una acción inequívoca, por ejemplo «Añadir una unidad». Comprueba con Tab que recibe foco y con Enter o Espacio que se activa. Conserva una captura del foco y registra la plataforma usada. No busques un `IconButton` inexistente en el ZIP.

Un icono sin nombre accesible no explica su propósito a quien usa lector de pantalla. El texto visible, una etiqueta semántica y un `Tooltip` pueden ayudar, pero un tooltip solo no sustituye toda la comprobación con teclado y tecnologías de apoyo.

**Practica · K5.** Antes de implementar un diálogo en AulaFlow, escribe dos casos: Cancelar conserva el valor; Confirmar lo cambia una vez. Dibuja los botones y el texto que explica la consecuencia. No hagas el cambio antes de recibir el resultado del diálogo. Guardarás esta predicción para el capítulo «Interacción, vacío y error» del siguiente libro.

## Comprueba tu pantalla y pasa a la práctica 1

Ya puedes explicar un árbol sencillo, reparar una restricción y comprobar que dos navegaciones representan los mismos destinos. Ahora consolida estas decisiones en la práctica de 45 minutos.

Antes de continuar, comprueba en tu copia de ejemplos:

- 390 px: barra inferior y contenido completo;
- 900 px: barra lateral y el mismo destino seleccionado;
- texto ampliado: etiquetas completas y acciones disponibles;
- teclado: foco visible y botón utilizable;
- ningún cambio de práctica ha roto `flutter analyze` ni los tests.

Guarda en el cuaderno las predicciones y comprobaciones K1–K5. Son entrenamiento, no cinco tareas de Moodle. Puedes descartar la copia con el fallo deliberado cuando hayas conservado la evidencia.

Si el problema es el espacio, vuelve a [El espacio disponible](14_PANTALLAS_APRENDE_PRACTICA_PM3.md). Si no arranca, abre [Ayuda de ejecución](13_GUIA_INICIO_Y_AYUDA_PM3.md). No pases a integrar un error que aún no puedes reproducir.

Continúa en PM3 · Práctica 1: adapta una pantalla (consulta en AULES). Puedes hacerla desde casa o en el taller del 20/10; son alternativas de 45 minutos efectivos.

Referencias de consulta, sin trabajo adicional: [constraints de Flutter](https://docs.flutter.dev/ui/layout/constraints), [diseño adaptable](https://docs.flutter.dev/ui/adaptive-responsive), [accesibilidad](https://docs.flutter.dev/ui/accessibility).
