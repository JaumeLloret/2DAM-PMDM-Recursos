"""Aritmética con precios introducidos, sin consultar tarifas ni contar tokens reales."""
import argparse
import json
from decimal import Decimal

p = argparse.ArgumentParser()
p.add_argument("--entrada", type=int, required=True)
p.add_argument("--salida", type=int, required=True)
p.add_argument("--precio-entrada", type=Decimal, required=True)
p.add_argument("--precio-salida", type=Decimal, required=True)
a = p.parse_args()
if min(a.entrada, a.salida, a.precio_entrada, a.precio_salida) < 0:
    p.error("Los valores deben ser no negativos")
coste = (Decimal(a.entrada) * a.precio_entrada + Decimal(a.salida) * a.precio_salida) / Decimal(1000000)
print(json.dumps({"modo":"SIMULACION_NUMERICA", "coste":str(coste),
    "unidad":"misma moneda introducida, precios por millón", "tarifa_real_consultada":False}))
