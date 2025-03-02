# Sistema de Controle e Gerenciamento de Ordens de Serviço - Oficina Mecânica

## Descrição do Projeto
Este projeto tem como objetivo modelar um sistema de controle e gerenciamento de execução de ordens de serviço para uma oficina mecânica. O sistema permitirá o cadastro de clientes, veículos, mecânicos, equipes e ordens de serviço, além de gerenciar os serviços e peças utilizados durante os reparos.

O esquema conceitual foi elaborado a partir da narrativa fornecida, estruturando as entidades, seus relacionamentos e atributos. Com base nesse modelo, foi criada a modelagem lógica em SQL para implementação do banco de dados.

## Modelagem do Banco de Dados
O banco de dados é composto pelas seguintes entidades principais:
- **Cliente**: Cadastro de clientes que levam seus veículos para manutenção.
- **Veículo**: Registro dos veículos pertencentes aos clientes.
- **Ordem de Serviço (OS)**: Documento que contém os serviços e peças necessários para um reparo.
- **Mecânico**: Profissionais responsáveis pelos serviços de manutenção.
- **Equipe**: Conjunto de mecânicos responsáveis por uma OS.
- **Serviço**: Tabela contendo os serviços disponíveis e seus respectivos valores de mão de obra.
- **Peça**: Cadastro de peças utilizadas nos reparos.

## Estrutura do Banco de Dados

- Cada cliente pode possuir vários veículos.
- Cada veículo pode ter múltiplas ordens de serviço associadas.
- Cada OS pode conter vários serviços e peças.
- Cada serviço é executado por mecânicos especializados.
- Cada equipe é composta por vários mecânicos e pode ser responsável por múltiplas ordens de serviço.

## Autor
Jessica Estuqui - Desenvolvedora

