Teste prático para vaga de emprego usando ruby on rails, o desafio se consistia em uma aplicação ToDo compartilhada com autenticação feita na mão sem uso do devise, usando o Framework Ruby on Rails e PostgreSQL.
Após ja estar com o projeto em seu PC, rode os seguintes comandos:

- bundle
- yarn
  
  1 - rails dev:setup para criar e popular o BD(Por algum motivo a gem do Faker ta bugada e esta gerando CPF invalidos de vez em quando)    
  2 - O login é feito pelo numero do Telefone, sendo entrar no BD pelo rails c, e pegar o telefone de um User
    2.1 - Ex. User.first
  
  rails s para rodar o servidor como localhost
