# Gimnasio graduado · PM6

Dentro de A03/A04/A05/A07. No son horas añadidas ni diez entregas. Trabaja en **un cuaderno** (o en Q01/Q02/Q03 según el caso): para cada kata **lee → predice → escribe/cambia una prueba → ejecuta → explica** qué detecta y qué no. Usa el mismo starter y reutiliza tests cuando sea posible. Si una kata exige DevTools o Android y no dispones del destino, registra protocolo y pendiente, luego solicita la observación; no conviertas la simulación host en evidencia física.

| Kata | Nivel / encargo | Criterio de autocontrol |
|---|---|---|
| K1 | Reconocer: diferencia prueba humo verde de comportamiento correcto del contador | Identifica un bug que la prueba inicial no detecta |
| K2 | Aplicar: escribe caso vacío y todos completados | Aserciones sobre resultado funcional, no constantes privadas |
| K3 | Aplicar: invierte el orden de dos respuestas con Completer | El resultado final corresponde a la política escrita |
| K4 | Aplicar: falla la segunda solicitud y termina después la primera | El error de la vigente no es borrado por respuesta antigua |
| K5 | Aplicar: error→retry→lista vacía en widget | No spinner eterno; salida visible y acción usable |
| K6 | Transferir: desmonta pantalla con solicitud pendiente | No notificación tardía/estado publicado en controlador desechado |
| K7 | Inspeccionar: provoca texto ampliado y revisa lista/contador | Registra overflow observado o ausencia observada con entorno, no supuesta |
| K8 | Medir: compara eager/builder con1500elementos en profile | Mismo recorrido/objetivo; conserva traza y límite de inferencia |
| K9 | Medir: repite cargas y examina history/Memory | Separa retención lógica, heap y memoria del proceso |
| K10 | Integrar: una modificación invalida run anterior | Vincula SHA, tests ejecutados, APK y destino realmente observado |

Para K1 escribe una frase que contraste humo y contador. Para K2–K6 conserva al menos una aserción discriminante antes/después, el comando aislado y una regresión. En K7 observa el árbol/estado, no infieras un overflow sin verlo. Para K8/K9 usa el [protocolo de DevTools](08_DEVTOOLS_Y_CI_PM6.md) con misma carga y modo; anota datos solo si los mediste. K10 enlaza SHA y capas de evidencia sin atribuir instalación al build. Las claves de corrección quedan reservadas. El cuestionario de práctica se incluye en A07 y no tiene peso propio.
