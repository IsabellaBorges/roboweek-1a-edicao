
***Settings***
Documentation    Cadastro de jogos 

Library     SeleniumLibrary

# BDD (Desenvolvimento guiado por comportamento)

***Test Cases *** 
Cadastrar novo jogo 

    Dado que eu acesso o portal de casdastro de jogos 
    Quando eu faço o cadastro de um novo jogo
    Então a mensagem de sucesso "Produto cadastrado com sucesso"
    E vejo este novo jogo na lista

       
***Keywords ***
Dado que eu acesso o portal de casdastro de jogos 

    Open Browser        http:localhost:3000         chrome 
    Set Selenium Implicit Wait  5
    Click Link          /produtos/new

Quando eu faço o cadastro de um novo jogo
    
    Input Text          id:produto_nome             Call of Dut Black Ops
    Input Text          id:produto_descricao        Um jogo de primeira pessoa, muito bacana.                                   
    Input Text          id:produto_preco            99.99
    Input Text          id:produto_quantidade       10
    Click Element       xpath://input[@value='Criar Produto']
 

Então a mensagem de sucesso "${mensagem_esperada}"
    
    Element Should Contain          css:div[role=alert]     ${mensagem_esperada}.

E vejo este novo jogo na lista

    Element Should Contain          css:table tbody         Call of Dut Black Ops Um jogo de primeira pessoa, muito bacana. R$ 99.99 10

    Capture Page Screenshot
    Close Browser




