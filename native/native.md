# Native Exercises

## Flavor

* Implemente Flavor para alterar os Clientes, ex.: Daniel e FTeam.
* Implemente o DartDefine para alterar os Ambients, ex.: Dev, Prod.

### Requisitos técnicos
* Implemente no Android e iOS
* Utilizar Flavor e DartDefine
* AppIcon, AppName, BundleID devem mudar


## MethodChannel
Faça uma listagem de algum tópico, por exemplo: Series, Filmes, Times, Linguagens.

* No Flutter, deve conter um campo de texto e um FAB.
* Ao clicar no FAB, o valor deve ser enviado pelo MethodChannel.
* O MethodChannel deve adicionar o valor na lista que está no nativo.
* Sempre que o Flutter adicionar um item, o nativo deve fazer uma chamada no mesmo canal para mandar a lista atualizada
  * Flutter > MethodChannel(addItem) > Nativo(addItem) > Nativo(updateItems) > MethodChannel(updateItems) > Flutter

### Requisitos técnicos
* Deve ser configurado no iOS e Android
* Deve ter somente 1 canal
* Comunicação Bidirecional
  * Flutter para Nativo: Fluxo de adicionar
  * Flutter para Nativo: Fluxo de carregar os itens
  * Nativo para Flutter: Fluxo de atualizar os itens
* O Item deve ter
  * ID - Gerado randomicamente no Nativo
  * Name - Valor enviado pelo Flutter através do TextField

## FlutterModules
Faça um projeto nativo, Swift e Kotlin.  

* Faça um Menu simples no Nativo contendo botões
* Opções
  * Abrir o Flutter de forma pura
  * Abrir o Flutter em um nota específica
  * Abrir o Flutter previamente carregado
  * Abrir o Flutter através de um `entrypoint`
* Todas as telas do Flutter devem ter um botão de voltar na AppBar

### Requisitos técnicos
Tendo o projeto base previamente feito. Duplique-o para fazer a conexão de 2 formas diferentes
* Faça a conexão através do flutter pré buildado
  * Android - AAR
  * iOS - xcframework
* Faça a conexão através do flutter para ser compilado ao mesmo tempo
  * Android - include_flutter.groovy
  * iOS - podhelper.rb

