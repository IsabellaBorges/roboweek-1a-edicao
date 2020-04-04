
***Settings***
Documentation    Cadastro de jogos 

Resource        resources/keywords.robot

# BDD (Desenvolvimento guiado por comportamento)

Suite Setup         Inicia Sessao
Suite Teardown      Encerra Sessao
Test Teardown       Depois do Teste 


***Test Cases *** 
Cadastrar novo jogo 

    Dado Que Eu Acesso O Portal De Cadastro De Jogos
    Quando eu faço o cadastro de um novo jogo
    ...  Pitfaal    Aventura na selva   19.99   10
    Então a mensagem de sucesso "Produto cadastrado com sucesso"
    E vejo este novo jogo na lista

Nome deve ser obrigatório

    Dado Que Eu Acesso O Portal De Cadastro De Jogos
    Quando eu faço o cadastro de um novo jogo
     ...  ${EMPTY}    Aventura na selva   19.99   10
    Então devo ver a mensagem de alerta "Nome não pode ficar em branco"

Preço deve ser obrigatório

    Dado Que Eu Acesso O Portal De Cadastro De Jogos
    Quando eu faço o cadastro de um novo jogo
     ...  Pitfaal    Aventura na selva   ${EMPTY}    10
    Então devo ver a mensagem de alerta "Preço não pode ficar em branco"

Quantidade deve ser obrigatório

    Dado Que Eu Acesso O Portal De Cadastro De Jogos 
    Quando eu faço o cadastro de um novo jogo
    ...  Pitfaal    Aventura na selva   19.99   ${EMPTY} 
    Então devo ver a mensagem de alerta "Quantidade não pode ficar em branco"
       

   
    




