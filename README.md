### Farmers App

Este projeto será construído para gerenciar a dinâmica de compras em feira para
clientes.

Os clientes efetuarão seus pedidos pelo site. No fechamento do período estipulado,
será contabilizado quanto de cada produto deverá ser comprado.

Após as compras feitas, bastará inserir o valor gasto com os totais e o sistema
calculará quanto cada cliente deverá pagar.

## Instalação

É necessário possuir apenas o `docker` e `docker-compose` instalados.
```bash
docker -v
# Docker version 20.10.7, build f0df350

docker-compose -v
# docker-compose version 1.28.5, build c4eb3a1f
```
Uma vez que o seu sistema satisfaz essas dependências, basta clonar o projeto,
entrar no diretório principal `farmers_app` e rodar no terminal
`./scripts/farmers setup`.
Este script montará a imagem docker, construirá o serviço de banco de dados e
fará o setup inicial do projeto. Utilize-o também sempre que adicionar alguma `gem`
ao projeto, para remontar a imagem com a nova dependência.

```bash
cd farmers_app
./scripts/farmers setup
```

O projeto possui um script para facilitar o uso de alguns comandos mais usados.

Para verificar as opções disponíveis execute `./scripts/farmers` em seu terminal.
```bash
Esse script simplifica alguns comandos
Modo de uso: farmers <opção> <argumentos>

Opções disponíveis:

add_scripts: adiciona a pasta de scripts ao PATH com o alias 'farmers'
bash: abre um terminal bash
bin-setup: executa bin/setup
bundle <args>: executa o comando passado com bundle exec dentro do container
console: rails console
db:migrate: executa db:migrate
db:prepare: executa db:prepare
rubocop: executa o rubocop
rubycritic: executa o rubycritic e guarda os relatórios em reports/
run <args>: executa o comando passado dentro do container web
rspec <args>: executa o rspec
setup: refaz imagem e bd
start: inicia os containeres
stop: para os containeres
```

Caso deseje adicionar o alias `farmers` ao seu arquivo de configuração do shell,
utilize a primeira opção, e logo após reinicie o shell:

```bash
./scripts/farmers add_scripts
source ~/.bashrc # exemplo utilizando o bash
```
