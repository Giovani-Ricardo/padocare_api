# README

1 - Fazer download da ultima versão do ruby através do link: https://rubyinstaller.org/downloads/
selecionar a versão Ruby+Devkit para a plataforma utilizada

2 - Entre na pasta do projeto e execute o comando "bundle install" para fazer download de todas as dependencias

3 - Execute o comando "rails db:create" para criar o banco de dados

4 - Execute o comando "rails db:migrate" para criar as tabelas no banco de dados

5 - Execute o comando "rails db:seed" para popular o banco de dados

6 - Execute o comando "rails s" para iniciar o servidor

7 - Endpoints disponíveis da API:

    # Criar usuário
    post /user body: {"name", "email", "password", "admin"}

    # Fazer login
    post /login body: {"email", "password"}