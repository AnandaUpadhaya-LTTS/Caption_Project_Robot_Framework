*** Settings ***
Documentation       This suite will handle all the test cases related to invalid
...     Login credential test. Test case 002
Library     DataDriver      file=../Test_Data/Test_File.xlsx     sheet=Password_Validation
Resource        ../Resource/Base/CommonFunctionality.resource
Resource        ../Resource/Pages/Login_page.resource
Test Teardown   Close Browser
Test Template       Verify InValid Credential Test

*** Test Cases ***
Password_Validation_TC
#TC1     ananda@gmail.com        12345     Invalid password
#TC2     sunny@gmail.com       ${EMPTY}    Please enter your password

*** Keywords ***
Verify InValid Credential Test
        [Arguments]     ${username}     ${password}     ${expected_password_error}
        Launch Browser
        Click for UserName_Password Page Link
        Click for Login Page
        Enter Username    ${username}
        Enter Password    ${password}
        Click on Login
        Element Text Should Be    id=password__error        ${expected_password_error}
        Set Screenshot Directory    ${EXECDIR}${/}Screenshot