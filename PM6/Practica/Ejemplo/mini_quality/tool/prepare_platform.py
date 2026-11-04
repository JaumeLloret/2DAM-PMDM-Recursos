#!/usr/bin/env python3
"""Generate only missing platform folders with the exact course Flutter SDK."""
from pathlib import Path
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile

root = Path(__file__).resolve().parents[1]
if Path.cwd().resolve() != root:
    raise SystemExit('Abre la terminal en la carpeta que contiene pubspec.yaml.')
platforms = sys.argv[1].split(',') if len(sys.argv) == 2 else ['android', 'web']
if not platforms or set(platforms) - {'android', 'web'}:
    raise SystemExit('Uso: python3 tool/prepare_platform.py android,web')
flutter = shutil.which('flutter')
if not flutter:
    raise SystemExit('No se encuentra Flutter. Revisa PATH y abre otra terminal.')
version = json.loads(subprocess.check_output([flutter, '--version', '--machine'], text=True))
if version['frameworkVersion'] != '3.47.8':
    raise SystemExit('Esta práctica usa Flutter 3.47.8. Comprueba flutter --version.')
name = re.search(r'^name:\s*(\w+)\s*$', (root / 'pubspec.yaml').read_text(), re.M).group(1)
missing = [p for p in platforms if not (root / p).exists()]
if not missing:
    print('Las plataformas ya existen; no se sobrescribe ninguna.')
    raise SystemExit(0)
def hashes():
    return {str(p.relative_to(root)): hashlib.sha256(p.read_bytes()).hexdigest()
            for p in root.rglob('*') if p.is_file() and
            (p.relative_to(root).parts[0] in ['lib', 'test', 'integration_test', 'guided'] or
             p.name in ['pubspec.yaml', 'pubspec.lock'])}
before = hashes()
with tempfile.TemporaryDirectory(prefix='pm6-platform-') as tmp:
    target = Path(tmp) / name
    subprocess.run([flutter, 'create', '--no-pub', '--empty',
                    '--platforms=' + ','.join(missing), '--org=org.aulaflow.training',
                    '--project-name=' + name, str(target)], check=True,
                   env=dict(os.environ, FLUTTER_SUPPRESS_ANALYTICS='true'))
    for platform in missing:
        shutil.copytree(target / platform, root / platform)
    if not (root / '.metadata').exists():
        shutil.copyfile(target / '.metadata', root / '.metadata')
if before != hashes():
    raise SystemExit('Los archivos fuente han cambiado: revisa el diff antes de seguir.')
print('Plataformas preparadas: ' + ', '.join(missing) + '. Código y pruebas conservados.')
