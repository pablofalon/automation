*** Settings ***
Library             Selenium2Library

*** Variables ***
${palabraABuscar}   casos de prueba
${navegador}    firefox
${URL}  https://www.google.com/

*** Keywords ***
Abrir Navegador e ir a WebSite
        Open Browser    ${URL}     ${navegador}