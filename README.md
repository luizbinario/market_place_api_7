# Market Place API
## 📘 Sobre esta versão

Este repositório é uma reprodução do projeto original [market_place_api_6](https://github.com/madeindjs/market_place_api_6), de autoria de Alexandre Rousseau, agora implementado com a versão **7 do Ruby on Rails**.

O objetivo foi apenas adaptar o projeto para que funcione corretamente com o **Rails 7.x**, servindo como base para estudos e futuras atualizações.

Este projeto está licenciado sob a [Licença MIT](./LICENSE), com os devidos créditos ao autor original.


Este repositório contém o exemplo de aplicação do livro [API on Rails 6](https://github.com/madeindjs/api_on_rails).

A aplicação final será um mercado simples, onde os usuários poderão fazer pedidos, cadastrar produtos e mais. Existem várias opções para criar uma loja online, como [Shopify](http://shopify.com), [Spree](http://spreecommerce.com/) ou [Magento](http://magento.com).

O objetivo desta aplicação não é apenas te ensinar a criar uma API com Rails, mas sim como criar uma API **evolutiva** e **manutenível** com Rails. Ou seja, melhorar seus conhecimentos atuais sobre Rails. Nesta jornada, você aprenderá a:

- Criar respostas em JSON
- Testar seus endpoints com testes unitários e funcionais
- Configurar autenticação com JSON Web Tokens (JWT)
- Otimizar e aplicar cache à API

## Configuração

```bash
git clone https://github.com/madeindjs/market_place_api_6
cd market_place_api_6
bundle install
rake db:create
rake db:migrate
```

## Usage

Criar usuário

```sh
curl -X POST -d 'user[email]=toto@toto.fr' -d 'user[password]=toto1234' localhost:3000/api/v1/users
```

Obter token

```sh
curl -X POST -d 'user[email]=toto@toto.fr' -d 'user[password]=toto1234' localhost:3000/api/v1/tokens
```

Gerenciar produto

```sh
export TKN="eyJhbG...WqaXAcnE" # from /api/v1/tokens
# create
curl -X POST -H "Authorization: $TKN" -d "product[title]=Bag" -d "product[price]=10" localhost:3000/api/v1/products
# update: publish and add stock
curl -X PATCH -H "Authorization: $TKN" -d "product[published]=true" -d "product[quantity]=2" localhost:3000/api/v1/products/19
# list
curl -H "Authorization: $TKN" localhost:3000/api/v1/products
# delete
curl -X DELETE -H "Authorization: $TKN" localhost:3000/api/v1/products/19
```

Gerenciar pedido

```sh
export TKN="eyJhbG...WqaXAcnE" # from /api/v1/tokens
# create
curl -X POST -H "Authorization: $TKN" -d "order[product_ids_and_quantities][][product_id]=20" -d "order[product_ids_and_quantities][][quantity]=1" localhost:3000/api/v1/orders
# list
curl -H "Authorization: $TKN" localhost:3000/api/v1/orders
# show
curl -H "Authorization: $TKN" localhost:3000/api/v1/orders/7
```

## Requisitos

- Ruby 2.7+
- Sqlite
