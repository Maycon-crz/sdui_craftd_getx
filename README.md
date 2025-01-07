# SDUI CREFTD GETX

Aplicativo com exemplo de arquitetura serverdriven UI (SDUI), multirepo, exemplo de login, armazenamento local e integracao com servidor PHP e compilador de Flutter para Json para armazenamento no servidor facilitando o desenvolvimento.

Este projeto é um ponto de partida para uma aplicação.

## Sumário

* Tecnologias e recursos utilizados
* Iniciando
* Banco de dados
* Outros

### Tecnologias e recursos utilizados:

- [Dart 3.3.1](https://dart.dev)
- [Flutter 3.19.3](https://docs.flutter.dev)
- [GetX]

### Iniciando

### Banco de dados

* Dependencias adicionadas no pubspac.yaml > dependencies:
objectbox: ^4.0.3
objectbox_flutter_libs: ^4.0.3

* Dependencias adicionadas no pubspac.yaml > dev_dependencies:
build_runner: ^2.0.0
objectbox_generator:

* Dependencias adicionadas no pubspac.yaml, em baixo do dev_dependencies mas no primeiro nivel, essa pasta informada no output_dir precisa existir e quando rodar o comando dart run build_runner build vai ser gerado o arquivo objectbox.g.dart:
objectbox:
  output_dir: database

* Todo momento que alterar uma entidade comentar os pacotes marcados no pubspec.yaml e rodar o comando:
dart run build_runner build

### Outros

- [Escreva seu primeiro aplicativo de flutter](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

Para obter ajuda para começar com o desenvolvimento, veja a
[documentação online](https://docs.flutter.dev/).