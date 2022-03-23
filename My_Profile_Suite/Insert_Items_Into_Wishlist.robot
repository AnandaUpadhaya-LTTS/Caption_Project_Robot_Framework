*** Settings ***
Documentation       This suite will handle all the test cases related to insertion of Items
...     in the Wish List. Test case 003
Resource        ../Resource/Base/CommonFunctionality.resource
Resource        ../Resource/Pages/Login_page.resource
Library     DataDriver      file=../Test_Data/Test_WL.xlsx     sheet=WishList_Addition

Test Template       Adding Items Into Wishlist Template
Test Teardown   Close Browser


*** Test Cases ***
Adding Items Into Wishlist


*** Keywords ***
Adding Items Into Wishlist Template
        [Arguments]     ${username}       ${password}        ${Items}       ${Scroll}
        Launch Browser
        Click for UserName_Password Page Link
        Click for Login Page
        Enter Username    ${username}
        Enter Password    ${password}
        Click on Login
        Click Element    xpath=//a[text()="Home Office"]
        Sleep    2s
        Execute javascript  window.scrollTo(50,700)
        Sleep    2s
        Execute javascript  window.scrollTo(0,200)
        #Added the above sleep because it needs some time to load the mid section
        Scroll Element Into View    //*[@id="__next"]/div[4]/div/div[1]/div[5]/div/div/button
        Scroll Element Into View    xpath=//p[text()="Refer and Earn"]
        Sleep    2s
        Execute javascript  ${Scroll}
        Click Element     ${Items}
        Click Element    xpath=//div[@id="wishlist"]
        Click Element    xpath=//div[@class='c-close']
        Click Element    id=fp-user
        Click Element    xpath=//a[@href='https://www.homelane.com/account/wishlist']
        #Page Should Contain    Duplex study table
        Set Screenshot Directory    ${EXECDIR}${/}Screenshot