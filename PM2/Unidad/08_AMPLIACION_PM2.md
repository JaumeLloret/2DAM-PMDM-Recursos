# PM2 · Ampliación opcional

Estas propuestas son voluntarias, quedan fuera de las 480 min y no son requisito para PM3. Todas profundizan en las mismas decisiones de modelado de RA2.a; no introducen interfaz Flutter ni contenidos de unidades posteriores.

## A1 · Dos diseños válidos

Construye dos versiones pequeñas de una columna:

- mutable con operaciones controladas;
- inmutable, donde cada operación devuelve una nueva columna.

Compara facilidad de explicación, riesgo de alias y coste de cada cambio.

## A2 · Igualdad por identidad o por valor

Decide si dos `MemberRef('m1')` deben considerarse iguales. Antes de implementar `==` y `hashCode`, escribe qué comportamiento observable necesitas en un `Set` o como clave de `Map`.

## A3 · Índice por id

Compara buscar una tarjeta en una lista con mantener un `Map<String, TaskCard>`. No hagas benchmarking ornamental: justifica cuándo el índice compensa la complejidad añadida.

## A4 · Cambiar una regla sin añadir clases

Añade prioridad urgente con una capacidad especial. Intenta resolverla primero modificando el vocabulario y la regla existente. Crea una clase nueva solo si aparece una responsabilidad propia.

## A5 · Segundo dominio pequeño

Transfiere el patrón a una agenda de reservas o inventario local:

1. identifica tres estados inválidos;
2. diseña el mínimo de clases/enums;
3. escribe una clase que no crearías;
4. añade una operación local `Future` con error observable.

## A6 · Mejorar la explicación

Escribe un README para tu laboratorio que permita a otra persona:

- abrir la carpeta correcta;
- ejecutar el baseline;
- entender las reglas;
- reproducir un fallo;
- verificar una reparación.

## Regla de ampliación

Cada propuesta debe responder «qué problema nuevo resuelve». Si solo aumenta sintaxis o número de clases, conserva el experimento fuera del diseño base.

