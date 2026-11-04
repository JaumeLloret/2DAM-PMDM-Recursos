#!/usr/bin/env python3
"""Prepare absent Flutter platform folders, preserving app, tests and lock."""
from pathlib import Path
import hashlib,re,shutil,subprocess,sys,tempfile
root=Path(__file__).resolve().parent
targets=sys.argv[1:] or ['web']
if not targets or any(t not in ['web','android'] for t in targets):
 raise SystemExit('Uso: python preparar_plataformas.py web [android]')
if any((root/t).exists() for t in targets):
 raise SystemExit('La plataforma ya existe. No se sobrescribe; utiliza flutter run.')
flutter=shutil.which('flutter')
if not flutter:raise SystemExit('Flutter no aparece en PATH; consulta Entorno.')
name=re.search(r'^name:\s*(\w+)',(root/'pubspec.yaml').read_text(),re.M).group(1)
protected=[p for p in root.rglob('*') if p.is_file() and (p.relative_to(root).parts[0] in ['lib','test','integration_test'] or p.name in ['pubspec.yaml','pubspec.lock'])]
before={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in protected}
with tempfile.TemporaryDirectory(prefix='pm7-platform-') as tmp:
 generated=Path(tmp)/'project'
 subprocess.run([flutter,'create','--no-pub','--platforms='+','.join(targets),'--org','org.aulaflow.training','--project-name',name,str(generated)],check=True)
 for t in targets:shutil.copytree(generated/t,root/t)
 if not (root/'.metadata').exists():shutil.copy2(generated/'.metadata',root/'.metadata')
assert before=={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in protected}
print('Plataformas preparadas:',','.join(targets),'. Código, tests y lock conservados.')
