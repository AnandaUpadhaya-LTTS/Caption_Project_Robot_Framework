*** Settings ***
Documentation       This suite will handle all the test cases related to valid login
...     credential test. Test case 001
Resource        ../Resource/Base/CommonFunctionality.resource
Resource        ../Resource/Pages/Login_page.resource

Test Teardown   Close Browser

*** Variables ***
${username}         cse20013@tezu.ac.in
${password}         usy253qu

*** Test Cases ***
Verify Valid Credential Test
        Launch Browser
        Click for UserName_Password Page Link
        Click for Login Page
        Enter Username    ${username}
        Enter Password    ${password}
        Click on Login
        Click Element    Link=Customer Stories
        Click Element    xpath=//a[text()='Team']
        Page Should Contain    Design Gallery
        Set Screenshot Directory    ${EXECDIR}${/}Screenshot