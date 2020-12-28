#language: pt

@regressivo
Funcionalidade: Cadastro
    Sendo um músico que possui equipamentos musicais
    Quero fazer o meu cadastro no RockLov
    Para que eu possa disponibilizá-los para locação

    @cadastro
    Cenario: Fazer cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome            | email                    | senha     |
            | Alexandre Nunes | murillo@gmail.com | Teste@123 |
        Então sou redirecionado para o Dashboard



    Esquema do Cenario: Tentativa de Cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário de cadastro:
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | nome_input      | email_input              | senha_input | mensagem_output                  |
            |                 | alexandrenunes@gmail.com | Teste@123   | Oops. Informe seu nome completo! |
            | Alexandre Nunes |                          | Teste@123   | Oops. Informe um email válido!   |
            | Alexandre Nunes | alexandrenunes&gmail.com | Teste@123   | Oops. Informe um email válido!   |
            | Alexandre Nunes | alexandrenunes*gmail.com | Teste@123   | Oops. Informe um email válido!   |
            | Alexandre Nunes | alexandrenunes@gmail.com |             | Oops. Informe sua senha secreta! |




