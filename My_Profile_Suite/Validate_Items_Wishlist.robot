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
        Click Element    xpath=//a[text()="Modular Kitchen"]
        Click Element    xpath=//*[@id="plpPage"]/div[1]/div[4]/div/div[1]/ul/div[3]/div/div[1]/div/div[1]/div/div/div/div/div/div/div/img
        Click Element    xpath=//div[@id="wishlist"]
        Click Element    xpath=//div[@class="c-close"]
        Click Element    id=fp-user
        Click Element    xpath=//a[@href='https://www.homelane.com/account/wishlist']
        Page Should Contain    Purple Haze Straight Modular Kitchen
        Set Screenshot Directory    ${EXECDIR}${/}Screenshot