"""Compara una memoria simulada con una decisión canónica; no ejecuta un agente."""
import json
from pathlib import Path

raiz = Path(__file__).resolve().parent
decision = json.loads((raiz / "contexto/decision.json").read_text())
memoria = json.loads((raiz / "contexto/memoria.json").read_text())
estado = "COINCIDE" if memoria["regla"] == decision["regla"] else "CONFLICTO"
print(json.dumps({
    "modo": "COMPARACION_DE_DATOS_SIN_MODELO",
    "estado": estado,
    "decision_con_fuente": decision,
    "memoria_a_revisar": memoria,
    "siguiente_accion_humana": "Localizar la autoridad y versión vigentes antes de editar código o memoria",
}, ensure_ascii=False, indent=2))
