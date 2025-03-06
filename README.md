# README

Este projeto consiste em um [desafio](https://github.com/rafaellins-itau/desafio-itau-vaga-99-junior) proposto para uma vaga de desenvolvedor do banco Itaú. 

Para rodar o projeto é necessário:

* Ruby 3.3.7
* Rails 8.0.1
* NodeJS
* Yarn

Após clonar o repositório, acesse o diretório raíz do projeto em um terminal e rode os comandos:

`bundle install`

`yarn install`

Para configurar o banco de dados, rode:

`rails db:create`

`rails db:migrate`

E levante o servidor:

`rails server`

Para criar uma `transaction`, faça um POST para a URI `/transactions`. O `body` do post deve conter `value` e `transaction_time`. Exemplo:

```json
{
	"value": 90.00,
	"transaction_time": "2025-03-06T18:08:59Z"
}
```

Para acessar as estatísticas, faça um GET para a URI `/statistics`. Caso queira passar um intervalo de tempo personalizado, a URI deve ser `statistics?time_interval=10000000`, por exemplo.
