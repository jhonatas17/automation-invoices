#language: pt 

Funcionalidade: Cadastro de clientes
    Sendo um usuário do Invoices
    Posso cadastrar novos clientes
    Para fins de gerenciamento e também atendimento

Contexto: Acesso a página cliente
    * usuário logado acessa a página clientes

Cenario: Cadastro de clientes
  
   Dado que eu tenho uma lista de clientes
   Quando faço o cadastro desses clientes
   Então esses clientes deve ser exibidos na busca  

@unique
Cenario: Cadastro de novo cliente
    Ao cadastrar um novo cliente, o mesmo
    deve ser exibido na busca

    Dado que eu tenho um novo cliente
    Quando faço o cadastro desse cliente
    Então esse cliente deve ser exibido na busca  
