"""MCP real por stdio; catálogo DEMO, sin herramientas de escritura ni modelo."""
from mcp.server import MCPServer
from pydantic import BaseModel
from politica import AVISOS, seleccionar

mcp = MCPServer("PM7 Avisos de estudio")


class Seleccion(BaseModel):
    ids: list[str]
    total_fuente: int


@mcp.tool(structured_output=True)
def seleccionar_avisos(minimo: int = 3, ocultar_leidos: bool = True) -> Seleccion:
    """Lista IDs de avisos que cumplen prioridad mínima inclusiva Y lectura."""
    visibles = seleccionar(AVISOS, minimo, ocultar_leidos)
    return Seleccion(ids=[a.id for a in visibles], total_fuente=len(AVISOS))


@mcp.tool()
def consultar_aviso(id: str) -> dict:
    """Lee un aviso DEMO por identidad; error si no existe. No modifica datos."""
    for a in AVISOS:
        if a.id == id:
            return {"id": a.id, "titulo": a.titulo, "prioridad": a.prioridad, "leido": a.leido}
    raise ValueError("No existe el ID solicitado")


@mcp.resource("avisos://regla")
def regla() -> str:
    return "Prioridad mínima inclusiva Y ocultar leídos. Identidad por ID, orden y fuente conservados. Datos DEMO."


@mcp.prompt()
def revisar_criterio(criterio: str) -> str:
    return "Contrasta este criterio con avisos://regla. Predice IDs antes de llamar herramientas. Criterio: " + criterio


if __name__ == "__main__":
    mcp.run()
