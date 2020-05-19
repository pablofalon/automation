***Settings***
Library         Selenium2Library

*** Variables ***
${browser}      Firefox
${url}      http://www.winstoncastillo.com/udemy/
${HomeTitle}    Hola Mundo!

*** Keywords ***
Go To Url
    Open browser    ${url}      ${browser}

*** Test Cases ***
AP001 Ir al blog de Winston Castillo
    Go To Url
    Title Should Be     ${HomeTitle}
    Set Focus To Element    xpath=/html/body/div[1]/div/div[2]/a[1]
    Click Link      link:Este Link te dirije a otra ventana
    Wait Until Element Is Visible       xpath=//*[@id="page-header"]/div[1]/div/div/div/a
    Title Should Be     Winston Castillo – Un sitio para comunicarse
    Close Browser

AP002 - Abrir Modal
    Go To Url
    Title Should Be     ${HomeTitle}
    Set Focus To Element    xpath=/html/body/div[1]/div/div[2]/a[2]
    Click Link      xpath=/html/body/div[1]/div/div[2]/a[2]
    Title Should Be     ${HomeTitle}
    Wait Until Element Is Visible   xpath=/html/body/div[2]/div/div/div[2]
    Close Browser