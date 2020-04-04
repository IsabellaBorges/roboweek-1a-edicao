***Settings***
Documentation    Cadastro de jogos 

Library     SeleniumLibrary

Resource    elements.robot


***Variables***
${BASE_URL}     http:localhost:3000
       
***Keywords ***

###Ganchos 

Inicia Sessao 
    Open Browser        ${BASE_URL}         chrome 
    Set Selenium Implicit Wait  5

Encerra Sessao  
    Close Browser

Depois do Teste 
    Capture Page Screenshot
   
## Steps   

Dado que eu acesso o portal de cadastro de jogos 
    Go to        ${BASE_URL}/produtos/new

Quando eu faço o cadastro de um novo jogo
    [Arguments]         ${nome}     ${desc}     ${preco}       ${qtd}  

    Input Text          ${CAMPO_NOME}           ${nome} 
    Input Text          ${CAMPO_DESC}           ${desc}                                   
    Input Text          ${CAMPO_PRECO}          ${preco} 
    Input Text          ${CAMPO_QTD}            ${qtd} 

 #Esse key (SET TEST VARIABLE) é do Robot (Não é do Selenium)
    Set Test Variable   ${nome}
    Click Element       ${BTN_CRIAR_PROD}

 

Então a mensagem de sucesso "${mensagem_esperada}"

    Element Should Contain   ${ALERTA_SUCESSO}    ${mensagem_esperada}.

E vejo este novo jogo na lista

    Element Should Contain    ${LISTA_JOGOS}         ${nome}
Então devo ver a mensagem de alerta "${mensagem_esperada}"   
    Element Should Contain     ${ALERTA_ERRO}      ${mensagem_esperada}
   
    




