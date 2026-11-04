"""Datos y políticas didácticos. No utiliza modelos, red ni datos reales."""
from dataclasses import dataclass


@dataclass(frozen=True)
class Aviso:
    id: str
    titulo: str
    prioridad: int
    leido: bool


AVISOS = (
    Aviso("T-A", "Preparar equipo", 3, False),
    Aviso("T-B", "Enviar resumen", 1, False),
    Aviso("T-C", "Revisar reserva", 4, True),
    Aviso("T-D", "Preparar equipo", 3, False),
)


def seleccionar(fuente, minimo=3, ocultar_leidos=True, variante="correcta"):
    if not 1 <= minimo <= 5:
        raise ValueError("La prioridad debe estar entre 1 y 5")
    if variante not in {"correcta", "or", "limite", "identidad"}:
        raise ValueError("Variante desconocida")
    salida = []
    titulos = set()
    for aviso in fuente:
        prioridad = aviso.prioridad > minimo if variante == "limite" else aviso.prioridad >= minimo
        lectura = not ocultar_leidos or not aviso.leido
        incluir = prioridad or lectura if variante == "or" else prioridad and lectura
        if incluir:
            if variante == "identidad" and aviso.titulo in titulos:
                continue
            salida.append(aviso)
            titulos.add(aviso.titulo)
    return salida
