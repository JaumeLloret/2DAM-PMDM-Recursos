# Guía del alumnado · PM3

## Tu reto

Partirás de una app local que funciona pero solo piensa en una ventana compacta,
mezcla datos y presentación y navega pasando un mapa mutable. La transformarás
en una app que:

- ofrece tareas, tablero, ajustes y detalle;
- usa `NavigationBar` o `NavigationRail` según el espacio;
- utiliza `go_router` y un id de ruta;
- mantiene filtro/orden/datos en un ViewModel observable;
- depende de una interfaz de repositorio con fake en memoria;
- confirma un cambio y comunica el resultado;
- sigue siendo usable con texto grande y teclado.

## Ruta de 12 horas

| Paso | Min | Haz | Conserva |
|---|---:|---|---|
| 1 | 30 | diagnóstico y predicción | G0 |
| 2 | 80 | widgets/Material/controles + G1–G2/G4–G5 | notas y correcciones |
| 3 | 75 | responsive/constraints/accesibilidad + G3 | capturas y explicación |
| 4 | 55 | taller adaptable | diff mínimo |
| 5 | 80 | rutas + G6–G7 | mapa de navegación |
| 6 | 100 | estado/ViewModel + G8–G10 | tabla de estado |
| 7 | 75 | repository/DI + G11–G12 | mapa de dependencias |
| 8 | 110 | laboratorio integrado autónomo | artefacto ejecutable |
| 9 | 60 | microcambio, autorrevisión y documentación | registro/checklist |
| 10 | 55 | taller 2: modificación, debugging y defensa | I3 + cierre |

Todo está incluido: no sumes las katas como trabajo adicional.

## Antes de tocar código

1. Ejecuta `flutter --version` y `flutter doctor -v`.
2. Materializa Android si el paquete no trae plataforma:
   `flutter create . --platforms=android --project-name aulaflow_flutter_ui_shell_starter`.
3. Ejecuta `flutter pub get`, `flutter analyze`, `flutter test`, `flutter run`.
4. Prueba 390×800 y 900×700; escribe una predicción antes de cada prueba.
5. Si algo falla, registra comando, síntoma, hipótesis, acción y resultado.

## Entrega

- proyecto Flutter sin `build/`, secretos ni datos reales;
- tests que recibiste aún verdes;
- `02_PLANTILLA_DECISIONES_PM3.md` cumplimentada;
- `03_CHECKLIST_ENTREGA_PM3.md`;
- registro reproducible con versión, comandos y resultado;
- microvariación I3 realizada en el momento indicado.

Una captura aislada no demuestra el RA. El proyecto debe compilar/ejecutar y tu
explicación debe conectar widget, evento, estado y reconstrucción.

## Ayuda e IA

Puedes consultar documentación, compañeros y, si decides usarla, una IA. Declara
qué usaste, qué aceptaste/rechazaste y cómo lo verificaste. No compartas secretos
o datos personales. Durante I3 trabajarás sin agente. No se evalúa el prompt.

## Límites

No implementes REST, login, base de datos, almacenamiento, sensores, permisos,
multimedia, CI, DevTools, SDD/agentes ni el contrato real de AulaFlow. Hacer más
no mejora la evidencia de RA2.b y puede ocultarla.

