***Settings***
Documentation    Cadastro de jogos 

Library     SeleniumLibrary
Library     DatabaseLibrary
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

## Helpers 
Conecta no banco SQLite
    Connect To Database Using Custom Params    sqlite3      database="db/development.sqlite3", isolation_level=None  

Deleta pelo nome 
    [Arguments]     ${nome_produto}
    Conecta no banco SQLite
    Execute SQL String      delete from produtos where nome = '${nome_produto}'

## Steps   

Dado Que Eu tenho o seguinte produto

    [Arguments]         ${nome}     ${desc}     ${preco}       ${qtd} 

    Deleta pelo nome    ${nome}
##Esse key (Set Test..) é do Robot (Não é do Selenium)
    Set Test Variable   ${nome}
    Set Test Variable   ${desc}
    Set Test Variable   ${preco}
    Set Test Variable   ${qtd}


E acesso o portal de cadastro de jogos 
    Go to        ${BASE_URL}/produtos/new

Quando eu faço o cadastro desse item
  
    Input Text          ${CAMPO_NOME}           ${nome} 
    Input Text          ${CAMPO_DESC}           ${desc}                                   
    Input Text          ${CAMPO_PRECO}          ${preco} 
    Input Text          ${CAMPO_QTD}            ${qtd} 


    Click Element       ${BTN_CRIAR_PROD}

Mas o produto já foi cadastrado
    Quando eu faço o cadastro desse item
    E acesso o portal de cadastro de jogos 

Então a mensagem de sucesso "${mensagem_esperada}"

    Element Should Contain   ${ALERTA_SUCESSO}    ${mensagem_esperada}.

E vejo este novo jogo na lista

    Element Should Contain    ${LISTA_JOGOS}         ${nome}
Então devo ver a mensagem de alerta "${mensagem_esperada}"   
    Element Should Contain     ${ALERTA_ERRO}      ${mensagem_esperada}




