# API didáctica local · PM4

Servidor de práctica con Dart estándar y datos ficticios `DEMO-*`. No es el backend real de AulaFlow.

Desde la carpeta `PM4`:

```bash
dart run Recursos/API/demo_api.dart --port=8080
```

Debe aparecer `PM4_DEMO_API_READY http://127.0.0.1:8080`. Deja esa terminal abierta y abre otra para el cliente. Para detenerlo usa Ctrl+C.

En el ordenador, consulta `http://127.0.0.1:8080/health`; el emulador Android usa `http://10.0.2.2:8080`. Las credenciales de práctica son `demo@aulaflow.local` y `DEMO-pass`; solo sirven para este servidor local. El token `DEMO-TOKEN-PM4` es un fixture público de la práctica.

[Contrato, endpoints y escenarios](../../Unidad/05_API_DIDACTICA_PM4.md) · [Ejemplos guiados](../../Unidad/03_EJEMPLOS_GUIADOS_PM4.md)
