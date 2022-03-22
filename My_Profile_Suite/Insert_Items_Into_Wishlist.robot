*** Settings ***
Documentation       This suite will handle all the test cases related to insertion of Items
...     in the Wish List. Test case 003
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
        Click Element    xpath=//a[text()="Home Office"]
        Execute javascript  window.scrollTo(0,700)
        Sleep    1s
        #Added the above sleep because it needs some time to load the mid section
        Execute javascript  window.scrollTo(0,200)
        Scroll Element Into View    xpath=//p[text()="Refer and Earn"]
        Click Element    xpath=//img[@alt='Duplex study table']
        Click Element    xpath=//div[@id="wishlist"]
        Click Element    xpath=//div[@class='c-close']
        Click Element    id=fp-user
        Click Element    xpath=//a[@href='https://www.homelane.com/account/wishlist']
        Page Should Contain    Duplex study table
        Set Screenshot Directory    ${EXECDIR}${/}Screenshot