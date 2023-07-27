# Architecture Exercises

## ToDo

Faça um App de Tarefas

- Toda tarefa deve ter:
  - Nome
  - Status
  - Data
- Toda rotina deve ter:
  - Nome
  - Tarefas
- É possível ter tarefas avulsas e dentro de rotinas
- Ao mostrar as tarefas por status, as avulsas e rotineiras devem ser contempladas

### Requisitos técnicos

- Utilize o Mockup feito no exercício de Widget
- O Fluxo de Adicionar e Listar deve ser feito em Clean Arch
- FlutterModular
- Teste de unidade
- Persistir dados no SharedPreferences

## Gerenciador de Algo

- Faça um Gerenciador de alguma coisa(Pessoas, Produtos, Filmes, etc).

- Consiste em:
  - Liste as informações
  - Cadastre os items

### Requisitos técnicos

- Independente do que vá listar, deve ter no mínimo 5 validações e que não sejam todas simples, como `isEmpty`
  - Exemplo:
    - Nome e sobrenome sem caracteres especiais e números
    - Email
    - Idade maior de 18 anos
    - Telefone
    - Data de validade
    - Preço
- O Fluxo de Adicionar e Listar deve ser feito em Clean Arch
- FlutterModular
- Teste de unidade
- Persistir dados no SharedPreferences
