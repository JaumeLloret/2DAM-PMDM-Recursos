# Cuaderno de trabajo · PM4

## Diagnóstico inicial

| Pregunta | Predicción | Comprobación | Recuperación focalizada |
|---|---|---|---|
| ¿Dónde termina ViewModel y empieza Repository? |  |  |  |
| ¿Cómo propaga un `Future` un error? |  |  |  |
| ¿Qué dependencia inyectarías? |  |  |  |
| ¿Qué estados evita un booleano `loading`? |  |  |  |

## Registro de kata

Repite para K1–K14: hipótesis; capa; cambio mínimo; comando/entrada; resultado real; conclusión. No pegues tokens, contraseñas ni bodies de login.

## Mapa de una operación

`evento View → ___ → ___ → remoto/local → ___ → estado ViewModel → View`

Anota para login, cargar, toggle, fallback, 401 y logout.

## Persistencia

| Dato | Sensible | Almacén | Vive tras reinicio | Borrado |
|---|:---:|---|:---:|---|
| token demo | sí |  |  |  |
| contraseña | sí |  |  |  |
| showCompleted | no |  |  |  |
| cache de tareas | no |  |  |  |

## Checkpoints de taller

- T1: fallo observado, capa, prueba, siguiente acción.
- T2: política remoto/local y evidencia de re-instanciación.
- T3: variante, diff, ejecución y explicación.

