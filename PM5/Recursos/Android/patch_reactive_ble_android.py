#!/usr/bin/env python3
"""Puente reproducible para reactive_ble_mobile 5.5.0 en Android SDK 36."""

from __future__ import annotations

import json
import sys
from pathlib import Path
from urllib.parse import unquote, urlparse
from urllib.request import url2pathname


def package_root(project: Path) -> Path:
    config_path = project / ".dart_tool/package_config.json"
    data = json.loads(config_path.read_text(encoding="utf-8"))
    package = next(
        (item for item in data["packages"] if item["name"] == "reactive_ble_mobile"),
        None,
    )
    if package is None:
        raise RuntimeError("reactive_ble_mobile no aparece en package_config.json")
    root_uri = urlparse(package["rootUri"])
    if root_uri.scheme == "file":
        return Path(url2pathname(root_uri.path)).resolve()
    if root_uri.scheme:
        raise RuntimeError(f"Esquema de paquete no soportado: {root_uri.scheme}")
    return (config_path.parent / unquote(package["rootUri"])).resolve()


def main() -> None:
    if len(sys.argv) != 2:
        raise SystemExit("Uso: patch_reactive_ble_android.py <directorio-proyecto>")
    root = package_root(Path(sys.argv[1]).resolve())
    pubspec = (root / "pubspec.yaml").read_text(encoding="utf-8")
    if "version: 5.5.0" not in pubspec:
        raise RuntimeError("El puente solo está autorizado para reactive_ble_mobile 5.5.0")

    gradle_path = root / "android/build.gradle"
    gradle = gradle_path.read_text(encoding="utf-8")
    old = "compileSdkVersion 33"
    new = "compileSdkVersion 36"
    if gradle.count(old) == 1:
        gradle_path.write_text(gradle.replace(old, new), encoding="utf-8")
        state = "aplicado"
    elif gradle.count(new) == 1 and old not in gradle:
        state = "ya_aplicado"
    else:
        raise RuntimeError("La configuración BLE cambió; revalidación manual obligatoria")
    print(f"PASS_BLE_ANDROID_BRIDGE_PM5 · 5.5.0 · compileSdk 36 · {state}")


if __name__ == "__main__":
    main()

