*** Settings ***
Documentation       This suite will handle all the test cases related to valid login
...     credential test. Test case 001
Resource        ../Resource/Base/CommonFunctionality.resource

Test Teardown   Close Browser

*** Test Cases ***
Verify Valid Credential Test
        Launch Browser
        Click Element    xpath=//a[text()='Login/Register']
        Click Element    id=login
        Input Text    name=email    cse20013@tezu.ac.in
        Input Text    name=password    usy253qu
        Click Button    id=enterlogin
        Click Element    Link=Customer Stories
        Click Element    xpath=//a[text()='Team']
        Page Should Contain    Design Gallery
        Set Screenshot Directory    ${EXECDIR}${/}Screenshot