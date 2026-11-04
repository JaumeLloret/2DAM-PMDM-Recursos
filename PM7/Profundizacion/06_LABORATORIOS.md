# Laboratorios voluntarios: prepara, predice y comprueba

**Opcional, sin nota, sin entrega y fuera de las 6 horas.** Usa una carpeta independiente. El ZIP contiene datos ficticios y código legible; no solicita claves ni conecta cuentas. No necesitas Flutter para estas experiencias. Las tres primeras requieren Python 3.12 y no instalan dependencias. MCP es una cuarta experiencia opcional con instalación en un entorno virtual.

## 1. Descarga y comprueba el punto de partida

Descarga **PM7_PROFUNDIZACION_LABORATORIOS.zip** desde esta página, extráelo y abre una terminal en la carpeta `Laboratorios`, donde aparecen `politica.py`, `comprobar.py` y `README.md`. Abre esos archivos antes de ejecutar. Comprueba Python con `python --version` (Windows suele ofrecer `py -3.12 --version`; Linux/macOS puede usar `python3 --version`). La referencia comprobada usa Python 3.12.

En los comandos siguientes `python` representa ese intérprete. Si tu equipo utiliza `py -3.12` o `python3`, sustituye solo el comienzo del comando de forma coherente. No escribas los símbolos de una consola como `$` o `>` delante. Si no encuentras el archivo, revisa la carpeta actual; no instales un paquete con el mismo nombre para resolver una ruta equivocada.

## 2. Selección y tres defectos que deben ser rechazados

Predice IDs con mínimo 3 y ocultar leídos: T-A/T-D. Después ejecuta:

```bash
python comprobar.py --variante correcta
python comprobar.py --variante or
python comprobar.py --variante limite
python comprobar.py --variante identidad
```

El primer comando debe mostrar seis pruebas correctas (`OK`) y salir con código 0. Los otros tres deben mostrar fallos de aserción (`FAILED`) y salir con código distinto de 0. Son errores introducidos deliberadamente. Ejecuta cada comando por separado: algunos editores detienen una secuencia al primer código de error. Un error de sintaxis o de importación no es el rojo esperado; lee qué falló.

Relaciona cada rojo con el contrato. OR deja pasar elementos que solo cumplen una condición; el límite exclusivo pierde prioridad 3; fusionar títulos pierde uno de los dos IDs distintos. El libro de verificación desarrolla esos casos y sus límites.

## 3. Memoria contradictoria y coste ficticio

```bash
python contexto.py
python costes.py --entrada 2000 --salida 500 --precio-entrada 1 --precio-salida 4
```

`contexto.py` debe informar `CONFLICTO`: el resumen simulado v1 contradice la decisión canónica v2. No modifica archivos ni resuelve la decisión mediante un modelo. Abre los dos JSON de `contexto/`, explica cuál es la referencia y redacta una memoria corregida en otra copia si quieres practicar.

`costes.py` debe identificar `SIMULACION_NUMERICA` y coste `0.004`. Los precios de ejemplo son ficticios por millón de tokens; no son una tarifa vigente. El programa calcula con las cantidades que introduces, no mide el consumo de una sesión. Prueba a duplicar entrada y salida conservando precios y predice el resultado antes de ejecutarlo.

## 4. MCP real sin modelo: entorno separado

Esta experiencia requiere descargar el SDK oficial desde PyPI y sus dependencias. Si no puedes instalarlas, puedes leer cliente y servidor sin ejecutarlos. No afecta a la unidad. En Windows, desde `Laboratorios`:

```powershell
py -3.12 -m venv .venv
.venv\Scripts\python.exe -m pip install --only-binary=:all: -r requirements-mcp.txt
.venv\Scripts\python.exe cliente_mcp.py
```

En Linux/macOS con Python 3.12 disponible:

```bash
python3.12 -m venv .venv
.venv/bin/python -m pip install --only-binary=:all: -r requirements-mcp.txt
.venv/bin/python cliente_mcp.py
```

Si tu instalación verificada de Python 3.12 se llama `python3`, úsala en el primer comando. En algunas distribuciones hace falta el componente de creación de entornos virtuales del sistema; solicita su preparación o utiliza la vía de lectura. No hace falta activar el entorno: los comandos indican directamente su intérprete.

El requisito fija `mcp==2.3.0`. `requirements-mcp-lock.txt` conserva las versiones transitivas del entorno Linux/Python 3.12 usado en la comprobación; es un registro de reproducción, no una promesa de compatibilidad con todos los sistemas. El comando principal instala desde el requisito directo. No ejecutes `servidor_mcp.py` por separado: `cliente_mcp.py` lo inicia y cierra automáticamente por stdio local.

La salida final esperada incluye `status: PASS`, `sdk_mcp: 2.3.0`, IDs `T-A`/`T-D`, recurso y plantilla recuperados, `error_controlado: true` y `modelo_ejecutado: false`. En el entorno contrastado informó protocolo `2026-07-28`. Se genera además un diagnóstico en stderr al solicitar a propósito un ID inexistente. Esa traza está prevista si después el cliente termina con su informe PASS y código 0; una interrupción antes del informe exige revisar el error.

## 5. Si algo falla, localiza la capa

| Síntoma | Comprobación útil |
|---|---|
| No se encuentra `comprobar.py` | Abrir la terminal en la carpeta Laboratorios extraída |
| No existe el comando Python | Comprobar el intérprete disponible; preparar Python 3.12 |
| `ModuleNotFoundError: mcp` | Ejecutar con el Python de `.venv`, donde se instaló el requisito |
| Versión MCP distinta | No mezclar APIs: crear el entorno con 2.3.0 |
| La instalación no encuentra una rueda | Conservar el diagnóstico y usar la vía sin MCP |
| Una variante defectuosa muestra `OK` | Revisar archivo/variante y expectativas; no darla por correcta |
| MCP enumera herramientas pero falla en IDs | Separar integración de corrección de la política |

## 6. Límites de la comprobación

Se han ejecutado las seis pruebas de referencia, el rechazo de los tres mutantes, el conflicto y el cálculo, y el cliente/servidor MCP local con Python 3.12. No se ha ejecutado un modelo en estas prácticas ni se ha probado cada sistema operativo. Los comandos de Windows indican el equivalente del entorno virtual; su recorrido de terminal no se ha ensayado aquí. El resultado no certifica una interfaz Flutter, una cuenta externa ni un aislamiento general del equipo.

Cuando termines puedes cerrar la terminal y conservar o borrar tu copia de prácticas. No hay entrega ni finalización obligatoria. Para transferir el aprendizaje utiliza el ejercicio de intervalo inclusivo de los libros; conserva el proyecto ordinario separado.
