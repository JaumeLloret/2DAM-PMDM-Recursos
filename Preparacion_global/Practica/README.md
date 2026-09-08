# Conversor DEMO · ejercicio público / exercici públic

## Castellano

Flutter **3.47.2**, Dart **3.13.2**. Las dependencias de producción pertenecen al SDK; el lockfile conserva versiones y hashes transitivos. El docente prepara el entorno antes de cualquier aplicación evaluativa. Para entrenamiento, usa el entorno ya trabajado en las UDs.

Desde esta carpeta:

```bash
flutter pub get --enforce-lockfile
flutter analyze --no-pub --fatal-infos
flutter test --no-pub
flutter devices
```

Para la app gráfica, utiliza `flutter run --no-pub -d` seguido del ID real del destino preparado. Si la carpeta aún no tiene plataforma, materializa una copia con `flutter create --platforms=android,web,linux .` antes de practicar y conserva `lib`, `test`, `pubspec.yaml` y `pubspec.lock`; solo arranca el destino que tengas instalado y probado. No es necesario tener los tres destinos.

Resultado: aparece el conversor y `2.5` produce `2500.0 m`. El smoke solo comprueba ese recorrido inicial. El ejercicio del README superior pide incorporar una clase y validación de dominio; el material inicial no contiene esa solución. No hay red, cuenta, API, almacenamiento persistente ni datos personales.

Si falta SDK/paquete/destino, revisa el mensaje con el docente o la guía de entorno de PM1; no cambies versiones silenciosamente. Si introduces una coma, `double.tryParse` no la interpreta como punto decimal: usa punto en este ejercicio. Documenta el límite si no amplías la entrada.

## Valencià

Flutter **3.47.2**, Dart **3.13.2**. Les dependències de producció pertanyen a l’SDK; el lockfile conserva versions i hashes transitius. El docent prepara l’entorn abans de qualsevol aplicació avaluativa. Per a entrenar, usa l’entorn ja treballat en les UDs.

Executa els quatre comandaments anteriors des d’esta carpeta. Per a la vista gràfica, usa `flutter run --no-pub -d` seguit de l’ID real del destí preparat. Si falta la plataforma, materialitza una còpia amb `flutter create --platforms=android,web,linux .` abans de practicar i conserva `lib`, `test`, `pubspec.yaml` i `pubspec.lock`; executa només el destí instal·lat i comprovat. No cal tindre els tres.

Resultat: apareix el conversor i `2.5` produïx `2500.0 m`. El smoke només comprova eixe recorregut inicial. L’exercici del README superior demana incorporar una classe i validació de domini; el material inicial no conté eixa solució. No hi ha xarxa, compte, API, emmagatzematge persistent ni dades personals.

Si falta SDK/paquet/destí, revisa el missatge amb el docent o la guia d’entorn de PM1; no canvies versions silenciosament. `double.tryParse` no interpreta una coma com a punt decimal: usa punt en este exercici. Documenta el límit si no amplies l’entrada.
