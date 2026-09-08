# Referencias y actualización PM2

## Baseline utilizado

- Fecha de consulta técnica: **2026-09-05**.
- PM1 validó en CI **Flutter 3.47.2 / Dart 3.13.2**.
- Este entorno de Work no dispone de ejecutables `dart` ni `flutter`.
- La documentación oficial consultada declara que refleja **Dart 3.13.0**.
- Los paquetes fijan `sdk: ">=3.13.0 <4.0.0"` para hacer explícito el baseline; antes de publicar debe revalidarse con la stable instalada.
- No se usan features experimentales. Records y patterns requieren Dart 3.0 o posterior.

## Fuentes oficiales

| Tema | URL | Uso |
|---|---|---|
| Lenguaje Dart | https://dart.dev/language | mapa de tipos, clases, enums y asincronía |
| Tipos | https://dart.dev/language/type-system | tipado estático e inferencia |
| Variables | https://dart.dev/language/variables | `var`, `final`, `const`, `late` |
| Null safety | https://dart.dev/null-safety/understanding-null-safety | anulabilidad y promoción |
| Funciones | https://dart.dev/language/functions | parámetros, closures y retornos |
| Colecciones | https://dart.dev/language/collections | listas, sets, maps, spreads e if/for |
| Records | https://dart.dev/language/records | agregado pequeño e inmutable |
| Patterns | https://dart.dev/language/patterns | matching y destructuring |
| Branches/switch | https://dart.dev/language/branches | switch statements/expressions |
| Clases | https://dart.dev/language/classes | campos, constructores y métodos |
| Enums | https://dart.dev/language/enums | conjunto cerrado y enhanced enums |
| Asincronía | https://dart.dev/language/async | `Future`, `async`, `await`, errores |
| Archivo SDK | https://dart.dev/get-dart/archive | canales/versiones; stable es producción |
| Analyzer | https://dart.dev/tools/dart-analyze | procedimiento de análisis |
| Formatter | https://dart.dev/tools/dart-format | procedimiento de formato |
| Tests | https://dart.dev/tools/dart-test | ejecución de tests de materiales |

## Criterio de actualización antes de impartir

1. ejecutar el procedimiento técnico;
2. registrar versión y sistema operativo;
3. comprobar que el SDK satisface el rango;
4. revisar cambios de lenguaje/lints que afecten a ejemplos;
5. no introducir nueva sintaxis solo por estar disponible;
6. actualizar comandos/salidas únicamente después de ejecutarlos;
7. si se cambia código, repetir formato, analyzer, run y tests sobre el nuevo HEAD.

## Alternativas sencillas a sintaxis moderna

| Feature usada | Por qué | Alternativa |
|---|---|---|
| record nombrado | retorno local de éxito + mensaje | clase `MoveResult` si gana identidad/reglas |
| destructuring | leer campos con nombre | `result.ok`/`result.message` |
| switch expression | enum exhaustivo y resultado directo | `switch` statement |
| collection-if/spread | construir lista declarativa | `List.of` + `add`/`addAll` |

No se usan class modifiers como requisito, ni sealed classes, mixins, extensions o generics avanzados en la ruta base.


