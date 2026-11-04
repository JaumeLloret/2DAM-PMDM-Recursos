"""Cliente MCP real, sin LLM: descubre, lee y llama al servidor local de este ZIP."""
import asyncio
from importlib.metadata import version
import json
from pathlib import Path
import sys
from mcp import Client, StdioServerParameters


async def main():
    if version("mcp") != "2.3.0":
        raise RuntimeError("Utiliza mcp==2.3.0 en el entorno virtual de este laboratorio")
    servidor = Path(__file__).with_name("servidor_mcp.py").resolve()
    params = StdioServerParameters(command=sys.executable, args=[str(servidor)])
    async with Client(params) as cliente:
        herramientas = await cliente.list_tools()
        nombres = sorted(t.name for t in herramientas.tools)
        assert nombres == ["consultar_aviso", "seleccionar_avisos"], nombres
        recurso = await cliente.read_resource("avisos://regla")
        assert "Prioridad mínima" in recurso.contents[0].text
        resultado = await cliente.call_tool("seleccionar_avisos", {"minimo":3, "ocultar_leidos":True})
        datos = resultado.model_dump(mode="json", by_alias=True)
        assert datos.get("structuredContent", {}).get("ids") == ["T-A", "T-D"], datos
        error = await cliente.call_tool("consultar_aviso", {"id":"NO-EXISTE"})
        error_datos = error.model_dump(mode="json", by_alias=True)
        assert error_datos.get("isError") is True, error_datos
        plantillas = await cliente.list_prompts()
        assert any(p.name == "revisar_criterio" for p in plantillas.prompts)
        plantilla = await cliente.get_prompt("revisar_criterio", {"criterio":"prioridad 3 y sin leídos"})
        assert plantilla.messages
        print(json.dumps({"status":"PASS", "sdk_mcp":version("mcp"),
            "protocolo":cliente.protocol_version, "transporte":"stdio local real",
            "herramientas":nombres, "ids":datos["structuredContent"]["ids"],
            "recurso_leido":True,"plantilla_recuperada":True,"error_controlado":True,
            "modelo_ejecutado":False},ensure_ascii=False,indent=2))


if __name__ == "__main__":
    asyncio.run(main())
