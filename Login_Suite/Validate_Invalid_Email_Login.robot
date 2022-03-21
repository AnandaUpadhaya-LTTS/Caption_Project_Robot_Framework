*** Settings ***
Documentation       This suite will handle all the test cases related to invalid
...     Login credential test. Test case 002
Resource        ../Resource/Base/CommonFunctionality.resource
Test Teardown   Close Browser
Test Template       Verify InValid Credential Test

*** Test Cases ***

TC1     Peter@gmail      ${EMPTY}      Please enter a valid email address
TC2     ${EMPTY}    tina123      Please enter your email


*** Keywords ***
Verify InValid Credential Test
        [Arguments]     ${username}     ${password}     ${expected_email_error}
        Launch Browser
        Click Element    xpath=//a[text()='Login/Register']
        Click Element    id=login
        Input Text    name=email    ${username}
        Input Text    name=password    ${password}
        Click Button    id=enterlogin
        Element Text Should Be    id=email__error    ${expected_email_error}
        Set Screenshot Directory    ${EXECDIR}${/}Screenshot