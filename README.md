# Projeto Desktop Delphi Consumindo API REST
Este projeto é uma aplicação desktop desenvolvida em Delphi, criada para consumir duas APIs REST desenvolvidas em 
Delphi: uma para autenticação de usuários e outra para realizar operações CRUD no banco de dados Postgres. 
A integração entre o cliente desktop e as APIs é feita utilizando bibliotecas modernas para a comunicação HTTP e autenticação JWT.

## Tecnologias Utilizadas
- RESTRequest4Delphi: Biblioteca para realizar requisições HTTP a APIs REST.
- Horse-JWT: Utilizado para autenticação segura através de JSON Web Tokens.
- BCrypt: Para encriptação de senhas durante o processo de login.
- API REST de Autenticação: Desenvolvida para verificar as credenciais do usuário e gerar um token JWT.
- API REST CRUD com Postgres: Realiza operações CRUD em um banco de dados Postgres.

## Funcionalidades
- Autenticação de Usuários: O aplicativo faz login dos usuários autenticados através da API REST de autenticação, enviando as credenciais e obtendo um token JWT.
- Consumo de API CRUD: Após autenticação, o aplicativo desktop se comunica com a API REST para realizar operações CRUD (Create, Read, Update, Delete) no banco de dados Postgres.
- Validação e Armazenamento de Sessão: O token JWT recebido após o login é armazenado localmente para validar as requisições subsequentes à API CRUD.
- Integração com Postgres: O cliente desktop manipula dados consumidos da API que, por sua vez, se comunica com o banco de dados Postgres para persistência.
