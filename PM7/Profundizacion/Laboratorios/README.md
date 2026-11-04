# Laboratorios de profundización PM7

Voluntarios, sin nota, sin entrega y fuera de las seis horas. Datos DEMO. Referencia comprobada: Python 3.12. Las tres primeras experiencias no tienen dependencias externas ni utilizan modelos.

Lee la página `06_LABORATORIOS.html` del material de estudio para la explicación completa, resultados esperados y errores habituales.

Desde esta carpeta:

```bash
python comprobar.py --variante correcta
python comprobar.py --variante or
python comprobar.py --variante limite
python comprobar.py --variante identidad
python contexto.py
python costes.py --entrada 2000 --salida 500 --precio-entrada 1 --precio-salida 4
```

Referencia correcta: seis tests OK, código 0. Cada mutante: FAILED por aserciones, código 1 esperado. Conflicto: CONFLICTO. Coste: SIMULACION_NUMERICA, 0.004 (precios ficticios por millón; no mide tokens).

MCP opcional, Linux/macOS:

```bash
python3.12 -m venv .venv
.venv/bin/python -m pip install --only-binary=:all: -r requirements-mcp.txt
.venv/bin/python cliente_mcp.py
```

Windows:

```powershell
py -3.12 -m venv .venv
.venv\Scripts\python.exe -m pip install --only-binary=:all: -r requirements-mcp.txt
.venv\Scripts\python.exe cliente_mcp.py
```

No iniciar el servidor por separado: el cliente lo abre y cierra como subproceso. PASS exige catálogo, IDs T-A/T-D, lectura de recurso, recuperación de plantilla y error controlado de ID inexistente. Su traza stderr está prevista si termina en PASS/código0. No se ejecuta un modelo. SDK2.3.0, protocolo observado2026-07-28.

`requirements-mcp-lock.txt` registra dependencias del entorno contrastado Linux/Python3.12; el requisito directo es `requirements-mcp.txt`. El recorrido Windows no se ha ejecutado en esta comprobación. MCP no exige claves, puertos HTTP o cuenta externa en este caso.

Los archivos `AGENTS.ejemplo.md` y `SKILL.ejemplo.md` son documentos de estudio, no mecanismos instalados o cargados automáticamente. No renombrarlos sin comprender el comportamiento del cliente elegido.
