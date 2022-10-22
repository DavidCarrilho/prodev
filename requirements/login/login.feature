Feature: Login
Como um usuário
quero poder acessar minha conta e me manter logado
para que eu possa ver e responder enquetes de forma rápida

Cenário: Credenciais Válidas
Dado que o usuário informou Credenciais Válidas
Quando solicitar para fazer o Login
Então o sistema deve enviar o usuário para a página de enquetes
E manter o usuário logado

Cenário: Credenciais Inválidas
Dado que o usuário informou Credenciais Inválidas
Quando solicitar para fazer o Login
Então o sistema deve retornar uma mensagem de erro