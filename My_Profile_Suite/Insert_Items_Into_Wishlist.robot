*** Settings ***
Documentation       This suite will handle all the test cases related to insertion of Items
...     in the Wish List. Test case 003
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
        Click Element    xpath=//a[text()="Home Office"]
        Execute javascript  window.scrollTo(0,700)
        Sleep    1s
        Execute javascript  window.scrollTo(0,100)
        Scroll Element Into View    xpath=//p[text()="Refer and Earn"]
        Click Element    xpath=//img[@alt='Duplex study table']
        Click Element    xpath=//div[@id="wishlist"]
        Click Element    xpath=//div[@class='c-close']
        Click Element    id=fp-user
        Click Element    xpath=//a[@href='https://www.homelane.com/account/wishlist']
        Page Should Contain    Duplex study table
        Set Screenshot Directory    ${EXECDIR}${/}Screenshot