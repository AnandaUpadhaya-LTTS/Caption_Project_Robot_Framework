*** Settings ***
Documentation       This suite will handle all the test cases related to invalid
...     Login credential test. Test case 002
Library     DataDriver      file=../Test_Data/Test_File_1.xlsx     sheet=Email_Validation
Resource        ../Resource/Base/CommonFunctionality.resource
Resource        ../Resource/Pages/Login_page.resource
Test Teardown   Close Browser
Test Template       Verify InValid Credential Test

*** Test Cases ***
Email_Validation_TC
#TC1     Peter@gmail      ${EMPTY}      Please enter a valid email address
#TC2     ${EMPTY}    tina123      Please enter your email

*** Keywords ***
Verify InValid Credential Test
        [Arguments]     ${username}     ${password}     ${expected_email_error}
        Launch Browser
        Click for UserName_Password Page Link
        Click for Login Page
        Enter Username    ${username}
        Enter Password    ${password}
        Click on Login
        Element Text Should Be    id=email__error    ${expected_email_error}
        Set Screenshot Directory    ${EXECDIR}${/}Screenshot