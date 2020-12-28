#language: pt

@regressivo
Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema Rocklov
    Para anunciar meus equipamentos musicais

    @login
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "alexandrefilho@gmail.com" e "Teste@123"
        Então sou redirecionado para o Dashboard
    
    @tentativa_de_login
    Esquema do Cenario: Tentativa de Login

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | email_input              | senha_input | mensagem_output                  |
            | alexandrenunes@teste.com | abc123      | Usuário e/ou senha inválidos.    |
            | alexandre@404.com        | Teste@123   | Usuário e/ou senha inválidos.    |
            | alexandrenunes&gmail.com | Teste@123   | Oops. Informe um email válido!   |
            |                          | Teste@123   | Oops. Informe um email válido!   |
            | alexandrenunes@gmail.com |             | Oops. Informe sua senha secreta! |
            |                          |             | Oops. Informe um email válido!   |
