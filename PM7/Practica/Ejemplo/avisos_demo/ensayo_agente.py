#!/usr/bin/env python3
"""Deterministic teaching replay. No LLM, network, shell execution or deletion."""
from pathlib import Path
import shutil,sys

ROOT=Path(__file__).resolve().parent
DEST=ROOT/'ensayo_agente'
ACTION=sys.argv[1] if len(sys.argv)==2 else ''
if ACTION=='preparar':
    if DEST.exists():
        raise SystemExit('El ensayo ya existe; se conserva intacto. Usa otra copia del ZIP si necesitas empezar de nuevo.')
    source=(ROOT/'lib/notices.dart').read_text()
    if '&&' not in source:
        raise SystemExit('El ejemplo debe conservar el AND original antes de preparar el ensayo.')
    DEST.mkdir()
    for name in ['pubspec.yaml','pubspec.lock','analysis_options.yaml','preparar_plataformas.py']:
        shutil.copy2(ROOT/name,DEST/name)
    shutil.copytree(ROOT/'lib',DEST/'lib')
    (DEST/'lib/notices.dart').write_text(source.replace('&&','||',1))
    (DEST/'test').mkdir()
    (DEST/'test/propuesta_test.dart').write_text((ROOT/'lab_agente/propuesta_test.dart.txt').read_text())
    print('ENSAYO SIMULADO preparado en',DEST)
    print('No se ha llamado a ningún modelo. Ejecuta Flutter dentro de esa carpeta.')
elif ACTION=='reforzar':
    if not (DEST/'test/propuesta_test.dart').is_file():
        raise SystemExit('Primero ejecuta preparar desde la raíz del ejemplo.')
    target=DEST/'test/contrato_test.dart'
    if target.exists():
        raise SystemExit('La prueba independiente ya existe; no se sobrescribe.')
    target.write_text((ROOT/'lab_agente/contrato_test.dart.txt').read_text())
    print('Prueba independiente añadida. El OR preparado debe producir una aserción roja.')
else:
    raise SystemExit('Uso: python ensayo_agente.py preparar | reforzar')
