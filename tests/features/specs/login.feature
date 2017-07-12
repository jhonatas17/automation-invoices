#language: pt

Funcionalidade: Login
    Sendo um usuário
    Posso logar no sistema Invoices
    Para ter acesso ao cadastro de clientes e faturas

Contexto: Acesso
  * acessa a página de login

@logout @smoke
Cenario: Login com sucesso

    Dado que eu tenho um usuário do tipo "admin"
    Quando faço o login
    Então vejo o dashboard
        E vejo também a mensagem "Bem Vindo Jhonatas Santos!" 

Esquema do Cenario: Tentativa de login

   Dado que eu tenho o usuário <email> e <senha>
   Quando faço o login 
   Então vejo a mensagem <msg>

 Exemplos:
 |  email                    | senha         | msg                                 |
 | "jhonatas_eu@hotmail.com" | "123456"      | "Incorrect password"                |
 | "jhonatas_eu@hotmail.net" | "0817guinho"  | "User not found"                    |
 | "jhonatas_eu$hotmail.com" | "0817guinho"  | "Please enter your e-mail address." |

 