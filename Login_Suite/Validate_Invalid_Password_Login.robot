*** Settings ***
Documentation       This suite will handle all the test cases related to invalid
...     Login credential test. Test case 002
Resource        ../Resource/Base/CommonFunctionality.resource
Test Teardown   Close Browser
Test Template       Verify InValid Credential Test

*** Test Cases ***

TC1     ananda@gmail.com        12345     Invalid password
TC2     sunny@gmail.com       ${EMPTY}    Please enter your password

*** Keywords ***
Verify InValid Credential Test
        [Arguments]     ${username}     ${password}     ${expected_password_error}
        Launch Browser
        Click Element    xpath=//a[text()='Login/Register']
        Click Element    id=login
        Input Text    name=email    ${username}
        Input Text    name=password    ${password}
        Click Button    id=enterlogin
        Element Text Should Be    id=password__error        ${expected_password_error}
        Set Screenshot Directory    ${EXECDIR}${/}Screenshot