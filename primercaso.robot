*** Settings ***
Resource   recursos.robot

*** Variables ***
${seleccion}    Women

*** Keyword ***
Select Women Option
    Click Element   xpath=//*[@id="block_top_menu"]/ul/li[1]/a

*** Test Cases ***
G001 Búsqueda de palabras en google
    Abrir Navegador e ir a WebSite
    Wait Until Element Is Visible   xpath=//*[@id="hplogo"]
    Input Text      xpath=//*[@id="tsf"]/div[2]/div[1]/div[1]/div/div[2]/input     ${palabraABuscar}
    Click Element       xpath=//*[@id="hplogo"]
    Click Element       xpath=//*[@id="tsf"]/div[2]/div[1]/div[3]/center/input[1]
    Title Should Be     ${palabraABuscar} - Buscar con Google
    Page Should Contain     ${palabraABuscar}
    Close Browser

G002 Hacer click en el botón de búsqueda sin escribir palabras en Google
    Open Browser    ${URL}     ${navegador}
    Wait Until Element Is Visible   xpath=//*[@id="hplogo"]
    Click Element       xpath=//*[@id="tsf"]/div[2]/div[1]/div[3]/center/input[1]
    Close Browser

G003.Caso con condicional
    Open Browser    http://automationpractice.com/index.php     Firefox
    Wait Until Element Is Visible   xpath=//*[@id="header_logo"]/a/img
    Run Keyword If      '${seleccion}'=='Men'   Select Women Option   ELSE    Close Browser

G004.Caso completo
    Open Browser    http://automationpractice.com/index.php     Firefox
    Wait Until Element Is Visible   xpath=//*[@id="header_logo"]/a/img
    Set Global Variable   @{NombreContenedor}   /html/body/div/div[2]/div/div[2]/div/div[1]/ul[1]/li[1]/div/div[2]/h5/a     /html/body/div/div[2]/div/div[2]/div/div[1]/ul[1]/li[2]/div/div[2]/h5/a
    FOR   ${nombre}  IN      @{NombreContenedor}
        Click Element     xpath=${nombre}
        Wait Until Element Is Visible   id=bigpic
        Click Element     xpath=/html/body/div/div[1]/header/div[3]/div/div/div[1]/a/img
    END
    Close Browser

G005.Caso de prueba
    Open Browser https:www.google.com.ar    Firefox
    Close Browser