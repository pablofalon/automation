***Settings***
Library     Selenium2Library

***Variables***
${Url}      http://automationpractice.com/index.php
${Browser}      Firefox
@{Items}    1   2   3   4   5   6   7


***Keywords***
Open WebSite
    Open Browser    ${Url}      ${Browser}


***Test Cases***
AP001 - Verificar que la previsualización está funcionando correctamente a través del icono del ojo

    Open WebSite
    Wait Until Element Is Visible   xpath=//*[@id="header_logo"]/a/img
    Set Window Size     1000    900
    Set Selenium Speed  0.5 seconds
    :FOR    ${Item}     IN       @{Items}
        Set Focus To Element      xpath=//*[@id="homefeatured"]/li[${Item}]/div/div[2]/h5/a/i
        ${Titulo}      Get Text   xpath=//*[@id="homefeatured"]/li[${Item}]/div/div[2]/h5/a
        Click Element     xpath=//*[@id="homefeatured"]/li[${Item}]/div/div[1]/div/div[1]/a/i
        Wait Until Element Is Visible     xpath=/html/body/div[2]/div/div/div/div/iframe
        Select Frame    xpath=/html/body/div[2]/div/div/div/div/iframe
        Set Focus To Element     xpath=/html/body/div/div/div[2]/h1
        Wait Until Element Is Visible     xpath=/html/body/div/div/div[2]/h1
        Element Text Should Be   xpath=/html/body/div/div/div[2]/h1      ${Titulo}
        Unselect Frame
        Click Element     xpath=/html/body/div[2]/div/div/a

    END
    Close Browser


AP002 Verificar que la previsualización está funcionando correctamente a través del texto de preview

    Open WebSite
    Wait Until Element Is Visible   xpath=//*[@id="header_logo"]/a/img
    Set Window Size     1201    900
    Set Selenium Speed  0.5 seconds
    :FOR    ${Item}     IN       @{Items}
        Set Focus To Element    xpath=//*[@id="homefeatured"]/li[${Item}]/div/div[2]/h5/a
        Element Should Not Be Visible      xpath=//*[@id="homefeatured"]/li[${Item}]/div/a/i
        ${Titulo}      Get Text   xpath=//*[@id="homefeatured"]/li[${Item}]/div/div[2]/h5/a
        Mouse Over      xpath=//*[@id="homefeatured"]/li[${Item}]/div/div[1]/div/a[1]/img
        Click Element     xpath=//*[@id="homefeatured"]/li[${Item}]/div/div[1]/div/div[1]/a/i
        Wait Until Element Is Visible     xpath=/html/body/div[2]/div/div/div/div/iframe
        Select Frame    xpath=/html/body/div[2]/div/div/div/div/iframe
        Set Focus To Element     xpath=/html/body/div/div/div[2]/h1
        Wait Until Element Is Visible     xpath=/html/body/div/div/div[2]/h1
        Element Text Should Be   xpath=/html/body/div/div/div[2]/h1      ${Titulo}
        Unselect Frame
        Click Element     xpath=/html/body/div[2]/div/div/a

    END
    Close Browser



