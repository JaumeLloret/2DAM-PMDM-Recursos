# Ampliación · PM1

Estas rutas son opcionales. No compensan evidencia obligatoria pendiente.

## A1 · Segundo perfil de emulador

Crea dos AVD que difieran en API o formato. Ejecuta la misma app y compara:

- tiempo de arranque;
- legibilidad;
- espacio visible;
- resultado de la regla;
- qué conclusión sería inválida sin medir más.

No implementes UI adaptable: ese núcleo pertenece a PM3.

## A2 · Emulador frente a dispositivo Android real

Ejecuta también en un dispositivo autorizado:

- registra modelo/API sin identificadores personales;
- compara instalación, fluidez y entrada táctil;
- identifica dos aspectos que el AVD controla mejor y dos que el real revela mejor.

La evidencia de dispositivo real es adicional; no sustituye el emulador requerido.

## A3 · Toolchain iOS

Investiga, sin exigir instalación al grupo:

- por qué el toolchain completo depende de macOS/Xcode;
- diferencia entre iOS Simulator y Android Emulator;
- qué partes del código Flutter serían comunes y qué tareas de firma/publicación no lo son.

Entrega una página con fuentes oficiales.

## A4 · Segunda tecnología

Compara Flutter con una entre:

- Android nativo/Compose;
- React Native;
- Kotlin Multiplatform;
- PWA.

Usa un escenario concreto y cinco criterios. Incluye:

- una fortaleza;
- un coste;
- un riesgo de equipo;
- una prueba de concepto que reduciría incertidumbre.

## A5 · Inspección de configuración

Después de `flutter create`, localiza sin modificar en profundidad:

- dónde se declara el identificador Android;
- qué carpeta pertenece a plataforma;
- qué contenido es generado;
- qué deberías ignorar en una entrega.

No se pide empaquetado, firma, CI ni despliegue; pertenecen a PM6.


