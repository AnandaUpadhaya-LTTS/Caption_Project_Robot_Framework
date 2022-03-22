*** Settings ***
Documentation       This file handles browser configuration, reuseable scripts.

Library     SeleniumLibrary

*** Variables ***
${BROWSER_NAME}     edge
${URL}      https://www.homelane.com/

*** Keywords ***
Launch Browser

        IF  '${BROWSER_NAME}'=='edge'
            Set Local Variable    ${driver_name}     msedgedriver.exe
        ELSE IF  '${BROWSER_NAME}'== 'ff'
            Set Local Variable    ${driver_name}     geckodriver.exe
        ELSE
            Set Local Variable    ${driver_name}     chromedriver.exe
        END

        Open Browser    browser=${BROWSER_NAME}     executable_path=${EXECDIR}${/}Driver${/}${driver_name}
        Maximize Browser Window
        set selenium implicit wait      30s
        Set Screenshot Directory    ${EXECDIR}${/}Screenshot
        Go To    url=${URL}
        SeleniumLibrary.Capture Page Screenshot
