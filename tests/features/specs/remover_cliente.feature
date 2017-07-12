#language:pt 

@delete
Funcionalidade: Remover cliente
   Sendo um usuário do Invoices
   Posso remover somente os cliente que ainda não possuem fatura

Contexto: Cliente deve ser cadastrado
     * Cliente cadastrado com sucesso 


@customer_page @logout
Cenario: Remover cliente buscando na lista
    
      Quando faço a exclusão bsucando esse cliente na lista
      Então esse cliente não deve ser exibido na busca
 

@customer_page @logout @smoke
Cenario: Remover cliente cadastrado

      Quando faço exclusão desse cliente  
      Então esse cliente não deve ser exibido após a busca    