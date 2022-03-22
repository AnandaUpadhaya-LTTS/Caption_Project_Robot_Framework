*** Settings ***
Documentation       This file handles all operations in the login Page
Resource        ../Base/CommonFunctionality.resource

*** Variables ***
${USER_NAME_LOCATOR}        name=email
${PASSWORD_LOCATOR}         name=password
${LOGIN_LOCATOR}        id=enterlogin
${USER_NAME_PAGE_LOCATOR}       xpath=//a[text()='Login/Register']
${LOGIN_PAGE_LOCATOR}       id=login

*** Keywords ***
Click for UserName_Password Page Link
        Click Element    ${USER_NAME_PAGE_LOCATOR}

Click for Login Page
        Click Element       ${LOGIN_PAGE_LOCATOR}

Enter Username
      [Arguments]       ${Username}
      Input Text    ${USER_NAME_LOCATOR}    ${Username}

Enter Password
    [Arguments]     ${password}
    Input Password    ${PASSWORD_LOCATOR}    ${password}

Click on Login
    Click Button    ${LOGIN_LOCATOR}
