# Equivalencias de talleres · PM4

Estas actividades sustituyen el taller correspondiente cuando no puedes asistir. **No debes hacer taller presencial y equivalencia a la vez**: ambas ocupan los mismos 55 min ya incluidos en las 840 min de PM4.

## Taller 1 · 27/10 · HTTP, errores y arranque

Reproduce durante 55 min el mismo objetivo del taller presencial:

1. arranca la API didáctica y comprueba `/health`;
2. ejecuta una petición normal y registra método, URI, código y duración sin mostrar `Authorization`;
3. reproduce los escenarios `invalid-json` y `slow`;
4. clasifica cada fallo como transporte, protocolo, formato o timeout y señala la capa responsable;
5. arranca el starter contra la API local con la URL adecuada a tu entorno;
6. entrega un checkpoint breve: **fallo → capa → prueba → siguiente acción**.

Como evidencia puedes usar una grabación breve o capturas acompañadas del registro técnico saneado. Las capturas solas no sustituyen la explicación.

## Taller 2 · 03/11 · sesión, persistencia y Repository

Durante 55 min:

1. reproduce login y una respuesta 401 sin registrar credenciales ni token;
2. clasifica token, preferencia y cache como sensibles/no sensibles y asigna el almacén adecuado;
3. demuestra que una preferencia no sensible puede recuperarse tras re-instanciar la capa local;
4. explica con un ejemplo la política **remote-first con fallback a cache**;
5. registra qué debe ocurrir con sesión y cache ante 401.

Entrega el registro técnico y una explicación breve de la política remoto/local. No hace falta programar backend ni añadir un almacén distinto al del laboratorio.

## Taller 3 · 10/11 · autenticidad individual

La equivalencia de I3 **no publica la variante concreta**. Si faltas al taller, el docente te asignará una variante equivalente por el canal acordado. Dispondrás de:

- 23 min de microcambio individual sin agente;
- hasta 15 min de ejecución/depuración;
- hasta 10 min de explicación focalizada y cierre;
- 2 min de registro final.

Si el entorno impide verificar la ejecución, se registra `PENDIENTE_ENTORNO`. Si falta evidencia auténtica, `PENDIENTE_EVIDENCIA`. No se da una evidencia por observada sin comprobación.

## Seguridad

Usa solo datos `DEMO-*`. No entregues contraseñas reales, tokens completos, IP pública, secretos ni logs con `Authorization`. HTTP local es únicamente el carril reproducible del laboratorio; no sustituye la comprobación HTTPS controlada de la unidad.
