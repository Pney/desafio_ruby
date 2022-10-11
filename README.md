Basicamente esse projeto tem o intuito de demonstrar diversas tecnologias, usando o Framework Ruby on Rails e PostgreSQL.
Após ja estar com o projeto em seu PC, rode os seguintes comandos:

bundler para instalar as gemas necessárias
  yarn para instalar as bibliotecas necessárias
  
  1 - rails dev:setup para criar e popular o BD(Por algum motivo a gem do Faker ta bugada e esta gerando CPF invalidos de vez em quando)
  2 - O login é feito pelo numero do Telefone, sendo entrar no BD pelo rails c, e pegar o telefone de um User
    2.1 - Ex. User.first
  
  rails s para rodar o servidor como localhost
